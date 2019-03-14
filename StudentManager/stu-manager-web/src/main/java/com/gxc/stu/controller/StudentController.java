package com.gxc.stu.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gxc.stu.pojo.Deptment;
import com.gxc.stu.pojo.Specialty;
import com.gxc.stu.pojo.Student;
import com.gxc.stu.pojo.StudentEdit;
import com.gxc.stu.pojo.User;
import com.gxc.stu.service.DeptmentService;
import com.gxc.stu.service.SpecialtyService;
import com.gxc.stu.service.StudentService;

import pojo.StudentCondition;
import utils.FileUtils;
import utils.MyResult;
import utils.Page;

@Controller
public class StudentController {

	@Autowired
	private DeptmentService deptmentService;
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private StudentService studentService;
	
	@Value("${UPLOAD_PICPATH}")
	private String UPLOAD_PICPATH;
	@Value("${UPLOAD_IP}")
	private String UPLOAD_IP;
	
	/**
	 * 添加用户前,获取院系,专业列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/stu/addStuPage")
	public String addStuPage(Model model){
		//查询所有的院系
		List<Deptment> deptList = deptmentService.findDeptLists();
		//放入Model中
		model.addAttribute("deptList", deptList);
		return "addStu";
	}
	
	/**
	 * 专业部门二级联动
	 * @param deptId
	 * @return
	 */
	@RequestMapping("/stu/findSpeByDeptId")
	@ResponseBody
	public MyResult getSpeListByDeptId(@RequestParam(name="deptId",defaultValue="0") Integer deptId){
		//根据部门Id查询所有的专业
		List<Specialty> speList = specialtyService.findSpeListByDeptId(deptId);
		//如果该deptId有专业
		if(speList.size() > 0)
			return MyResult.build(200, "", speList);
		//如果没有专业
		return MyResult.build(201, "");
	}
	
	/**
	 * Ajax判断该学生是否已经存在
	 * @param stuId
	 * @return
	 */
	@RequestMapping("/stu/findStuById")
	@ResponseBody
	public MyResult findStuById(String stuId){
		Student student = studentService.findStuByStuId(stuId);
		//如果学号存在
		if(student != null){
			return MyResult.build(201, "该学号已经存在,请检查...");
		}
		return MyResult.ok();
	}
	
	
	/**
	 * 添加学生信息,文件上传!
	 * 
	 * ########################################################################
	 * 注意！！：文件上传时的name属性(<input type="file">)，
	 * 		一定不要跟 实体类对象的字段名一样！
	 * ########################################################################
	 * @param student
	 * @param picFile
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/stu/addStudent.action",method = RequestMethod.POST)
	@ResponseBody
	public MyResult addStudent(Student student, 
					@RequestParam(name="picFile",required=false)MultipartFile picFile){
		
		//苹果兼容问题...
		if(picFile==null){
			//如果没上传
			student.setHeadPic("/images/defaultHead.jpg");
			//添加学生到数据库
			studentService.addStudent(student);
			//返回
			return MyResult.build(200, "学生添加成功！");
		}
		
		
		//1、判断用户是否上传了头像
		if(picFile.getSize()==0){
			//如果没上传，将${pageContext.request.contextPath}/images/defaultHead.jpg复制给头像字段
			student.setHeadPic("/images/defaultHead.jpg");
			//添加学生到数据库
			studentService.addStudent(student);
			//返回
			return MyResult.build(200, "学生添加成功！");
		}
		
		/* 可能执行不了这一句，被全局异常处理拦截下来 */
		if(picFile.getSize()>2100000){
			return MyResult.build(201, "图片大小需小于2M");
		}
		
		//2、判断图像的后缀名是否正确
		//2.1：获取文件的后缀名
		String extension = FilenameUtils.getExtension(picFile.getOriginalFilename());
		//2.2：判断用户上传的格式是否正确
		boolean flag = extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("JPEG");
		//2.3：如果不正确返回结果
		if(!flag){
			return MyResult.build(201, "图片格式不正确,请重试...");
		}
		
		//3、文件上传操作
		//3.1：重置文件名称 日期+后缀名
		String dateStr = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		String fileName = dateStr + "." + extension;
		//3.2：判断文件夹是否存在(已学号为名称)，如果不存在则创建	：C:\studentHeadPic
		File path = new File(UPLOAD_PICPATH + "/" + student.getStuId());
		if(!path.exists()){
			path.mkdirs();
		}
		//3.3：文件上传
		try {
			picFile.transferTo(new File(path,fileName));
		} catch (IllegalStateException | IOException e) {
			return MyResult.build(201, "网络异常请重试");
		}
		//3.4：设置文件路径
		student.setHeadPic(UPLOAD_IP + student.getStuId() + "/" + fileName);
		//3.5：将学生信息添加到数据库
		studentService.addStudent(student);
		return MyResult.build(200, "学生添加成功！");
	}

	/**
	 * 按照条件查询学生列表
	 * @param student
	 * @param model
	 * @return
	 */
	@RequestMapping("/stu/stuList")
	public String stuList(StudentCondition student, Model model,
			@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="12")Integer size){
		
		//1、先查询出所有的部门，通过二级联动得到专业
		List<Deptment> deptList = this.deptmentService.findDeptLists();
		
		//通过部门查询所有的专业(为了回显)
		List<Specialty> speList = null;
		if(student.getDeptId()!=null){
			speList = this.specialtyService.findSpeListByDeptId(student.getDeptId());
		}
		
		//3、查询
		//List<Student> stuList = this.studentService.findStiListByCondition(student);
		Page<Student> stuList = studentService.findStiListByConditionAndPage(student,page,size);
		
		//2、查询数据回显
		//所有的部门列表
		model.addAttribute("deptList", deptList);
		//学生条件
		model.addAttribute("searchCdt",student);
		//为了回显，所以需要根据Id返回
		model.addAttribute("searchSpeList", speList);
		//学生列表
		model.addAttribute("page", stuList);
		return "stuList";
	}
	
	/**
	 * 编辑前，通过学号查询学生信息
	 * @param stuId
	 * @return
	 */
	@RequestMapping("/stu/findStuByStuId")
	@ResponseBody
	public MyResult findStuByStuId(String stuId){
		//1、通过学号查询学生信息
		Student student = this.studentService.findStuByStuIdEdit(stuId);
		//2、根据学生的deptId查询该部门所有的专业(为了数据回显)
		List<Specialty> speList = this.specialtyService.findSpeListByDeptId(student.getSpecialty().getDeptId());
		
		//注意：需要将日期  重新设置
		String birthday = new SimpleDateFormat("yyyy-MM-dd").format(student.getBirthday());
		String comeDate = new SimpleDateFormat("yyyy-MM-dd").format(student.getComeDate());
		
		//3、封装数据
		StudentEdit studentEdit = new StudentEdit();
		studentEdit.setSpeList(speList);
		studentEdit.setStudent(student);
		studentEdit.setBirthday(birthday);
		studentEdit.setComeDate(comeDate);
		return MyResult.ok(studentEdit);
	}
	
	
	/**
	 * 修改学生信息
	 * @param student
	 * @param fileInput
	 * @return
	 */
	@RequestMapping(value="/stu/updateStudent",method = RequestMethod.POST)
	@ResponseBody
	public MyResult updateStudent(Student student,
			@RequestParam(required=false,name="fileInput")MultipartFile fileInput,
			HttpServletRequest request){
		
		//更新专业前，判断是否为登录状态
		User user = (User)request.getAttribute("user");
		//1.如果不是登录状态,提示暂无权限，请登录
		if(user == null){
			return MyResult.build(201, "暂无权限，请登录");
		}
		//2.如果是登录状态，判断user的权限，如果权限不够，提示暂无权限更新
		if(user.getRole() == 2){
			return MyResult.build(201, "您的身份暂无权限修改");
		}
		
		
		//苹果兼容问题...
		if(fileInput==null){
			//如果没上传
			student.setHeadPic("/images/defaultHead.jpg");
			//添加学生到数据库
			studentService.addStudent(student);
			//返回
			return MyResult.build(200, "学生添加成功！");
		}
		
		//1、判断用户是否上传了头像
		if(fileInput.getSize()==0){
			//如果没上传,保留原来的地址,更新学生信息
			studentService.updateStudent(student);
			//返回
			return MyResult.build(200, "学生更新成功！");
		}
		
		//判断文件上传的大小
		if(fileInput.getSize()>2100000){
			return MyResult.build(201, "图片大小需小于2M");
		}
		
		//2、判断图像的后缀名是否正确
		//2.1：获取文件的后缀名
		String extension = FilenameUtils.getExtension(fileInput.getOriginalFilename());
		//2.2：判断用户上传的格式是否正确
		boolean flag = extension.equalsIgnoreCase("jpg") || extension.equalsIgnoreCase("png") || extension.equalsIgnoreCase("JPEG");
		//2.3：如果不正确返回结果
		if(!flag){
			return MyResult.build(201, "图片格式不正确,请重试...");
		}
		
		//3、文件上传操作
		//3.1：重置文件名称 日期+后缀名
		String dateStr = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
		String fileName = dateStr + "." + extension;
		//3.2：判断文件夹是否存在(已学号为名称)，如果不存在则创建	：C:\studentHeadPic
		File path = new File(UPLOAD_PICPATH + "/" + student.getStuId());
		if(!path.exists()){
			path.mkdirs();
		}
		//3.3：文件上传
		try {
			fileInput.transferTo(new File(path,fileName));
		} catch (IllegalStateException | IOException e) {
			return MyResult.build(201, "文件上传失败，请检查网络...");
		}
		//3.4：设置文件路径
		student.setHeadPic(UPLOAD_IP + student.getStuId() + "/" + fileName);
		//3.5：将学生信息添加到数据库
		studentService.updateStudent(student);
		return MyResult.build(200, "学生信息更新成功！");
	}
	
	
	/**
	 * 删除用户信息,及头像等
	 * @param id
	 * @return
	 */
	@RequestMapping("/stu/deleteStu")
	@ResponseBody
	public MyResult deleteStu(Integer id, HttpServletRequest request){
		
		//更新专业前，判断是否为登录状态
		User user = (User)request.getAttribute("user");
		//1.如果不是登录状态,提示暂无权限，请登录
		if(user == null){
			return MyResult.build(201, "暂无权限，请登录");
		}
		//2.如果是登录状态，判断user的权限，如果权限不够，提示暂无权限更新
		if(user.getRole() == 2){
			return MyResult.build(201, "您的身份暂无权限修改");
		}
		
		//安全检测
		if(id==null || id==0){
			return MyResult.build(201, "删除失败");
		}
		
		//注意：先删除文件夹再删除数据库
		//删除文件夹下得图片 UPLOAD_PICPATH
		Student student = studentService.findStuById(id);
		//如果学生不存在
		if(student==null){
			return MyResult.build(201, "没有找到该学生...");
		}

		//删除相关 文件夹/文件
		File path = new File(UPLOAD_PICPATH + "/" + student.getStuId());
		if(path.exists() && path.isDirectory()){
			File[] files = path.listFiles();
			if(files.length > 0){
				for (File file : files) {
					file.delete();
				}
			}
			//删除文件夹
			path.delete();
		}
		
		//从数据库删除学生信息
		studentService.deleteStuById(id);
		
		return MyResult.build(200, "删除成功");
	}
	
	
	/**
	 * 按条件查询,并导出Excel
	 * @param request
	 * @param response
	 * @param studentConf 查询条件
	 * @throws Exception
	 */
	@RequestMapping("/stu/exportData")
	public void exportData(HttpServletRequest request,HttpServletResponse response,StudentCondition studentConf) throws Exception{
		
		//从数据库查询学生列表
		List<Student> list = this.studentService.findStiListByCondition(studentConf);
		
		//使用POI将数据写到Excel文件中
		//在内存中创建一个Excel文件
		HSSFWorkbook workbook = new HSSFWorkbook();
		//创建一个标签页
		HSSFSheet sheet = workbook.createSheet("学生信息");
		//创建标题行
		HSSFRow headRow = sheet.createRow(0);
		headRow.createCell(0).setCellValue("学号");
		headRow.createCell(1).setCellValue("姓名");
		headRow.createCell(2).setCellValue("性别");
		headRow.createCell(3).setCellValue("入学时间");
		headRow.createCell(4).setCellValue("专业名称");
		headRow.createCell(5).setCellValue("院系名称");
		
		for (Student student : list) {
			//增加一行
			HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
			dataRow.createCell(0).setCellValue(student.getStuId());
			dataRow.createCell(1).setCellValue(student.getStuName());
			dataRow.createCell(2).setCellValue(student.getGender()==0?"女":"男");
			if(student.getComeDate() == null){
				dataRow.createCell(3).setCellValue("未知");
			}else{
				dataRow.createCell(3).setCellValue(new SimpleDateFormat("yyyy-MM-dd").format(student.getComeDate()));
			}
			dataRow.createCell(4).setCellValue(student.getSpecialty().getSpeName());
			dataRow.createCell(5).setCellValue(student.getSpecialty().getDeptName());
		}
		
		//获取ServletContext对象
		ServletContext servletContext = request.getSession().getServletContext();
		
		//第三步：使用输出流进行文件下载（一个流、两个头）
		String filename = "学生数据.xls";
		String contentType = servletContext.getMimeType(filename);
		ServletOutputStream out = response.getOutputStream();
		response.setContentType(contentType);
		
		//获取客户端浏览器类型
		String agent = request.getHeader("User-Agent");
		filename = FileUtils.encodeDownloadFilename(filename, agent);
		response.setHeader("content-disposition", "attachment;filename="+filename);
		workbook.write(out);
	}
	
}
