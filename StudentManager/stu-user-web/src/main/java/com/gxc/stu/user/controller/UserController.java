package com.gxc.stu.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gxc.stu.pojo.User;
import com.gxc.stu.service.UserService;

import jedis.JedisClient;
import utils.CookieUtils;
import utils.JsonUtils;
import utils.MyResult;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${UPLOAD_PICPATH}")
	private String UPLOAD_PICPATH;
	@Value("${UPLOAD_IP}")
	private String UPLOAD_IP;
	
	/**
	 * 显示页面
	 * @param page
	 * @return
	 */
	@RequestMapping("/{page}")
	public String showPage(@PathVariable String page, HttpServletRequest request, Model model){
		//从request(登录的user)获取userid 查询信息
		User loginUser = (User) request.getAttribute("user");
		//从数据库中获取
		User user = userService.findUserById(loginUser.getId());
		model.addAttribute("user",user);
		model.addAttribute("loginUserId",loginUser.getId());
		return page;
	}
	
	
	/**
	 * 显示用户信息
	 * @param userId
	 * @return
	 */
	@RequestMapping("/user/{userId}")
	public String userDetail(@PathVariable Integer userId, HttpServletRequest request, Model model){
		
		//1.判断userId是否为空
		//如果为空,证明为自己的个人信息
		if(userId == null || userId <= 0){
			return "redirect:/index.html";
		}
		
		//从request(登录的user)获取userid 查询信息
		User loginUser = (User) request.getAttribute("user");
		//如果不为空，查询用户信息,返回用户信息
		User userById = userService.findUserById(userId);
		model.addAttribute("user",userById);
		model.addAttribute("loginUserId",loginUser.getId());
		return "index";
	}
	
	/**
	 * 更新用户信息
	 * @param user：用户信息
	 * @param fileInput：上传的文件
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/user/updateUser",method=RequestMethod.POST)
	@ResponseBody
	public MyResult updateUser(User user, MultipartFile fileInput, HttpServletRequest request){
		
		//判断登录的user，是否和需要修改的user的id一致
		User loginUser = (User)request.getAttribute("user");
		if(loginUser.getId() != user.getId()){
			return MyResult.build(201, "更新失败!");
		}
		
		if(fileInput == null){
			return MyResult.build(201, "未知错误,更新失败!");
		}
		
		//1、判断用户是否上传了头像
		if(fileInput.getSize()==0){
			//如果没上传,保留原来的地址,更新学生信息
			userService.updateUser(user);
			//返回
			return MyResult.build(200, "用户信息更新成功！");
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
		//3.2：判断文件夹是否存在，如果不存在则创建	：C:\studentHeadPic
		File path = new File(UPLOAD_PICPATH + "/" + user.getUsername());
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
		user.setHeadpic(UPLOAD_IP + user.getUsername() + "/" + fileName);
		//3.5：将学生信息添加到数据库
		userService.updateUser(user);
		
		//1.从cookie中获取token
		//根据userid查询user
		User dbUser = userService.findUserById(user.getId());
		String token = CookieUtils.getCookieValue(request, "token");
		jedisClient.set("SESSION:" + token, JsonUtils.objectToJson(dbUser));
		
		return MyResult.build(200, "学生信息更新成功！");
	}
	
	/**
	 * 删除成功（跨域jsonp请求）
	 * @param id
	 * @return
	 */
	@RequestMapping("/user/deleteUser")
	@ResponseBody
	public Object deleteUser(Integer id, String callback, HttpServletRequest request){
		//判断权限
		User user = (User)request.getAttribute("user");
		MyResult result = userService.deleteUser(id,user);
		if (StringUtils.isNotBlank(callback)) {
			//把结果封装成一个js语句响应
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		}
		return result;
	}
	
	
	/**
	 * 修改用户权限
	 * @param userId 需要被修改的用户id
	 * @param roleId 
	 * @param callback
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/editRole")
	@ResponseBody
	public Object editUserRole(Integer userId, Integer roleId, String callback, HttpServletRequest request){
		//判断权限
		User user = (User)request.getAttribute("user");
		MyResult result = userService.updateUserRole(userId,roleId,user);
		if (StringUtils.isNotBlank(callback)) {
			//把结果封装成一个js语句响应
			MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
			mappingJacksonValue.setJsonpFunction(callback);
			return mappingJacksonValue;
		}
		return result;
	}
}
