package com.gxc.stu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxc.stu.mapper.AccessdetailMapper;
import com.gxc.stu.pojo.Accessdetail;
import com.gxc.stu.pojo.AccessdetailExample;
import com.gxc.stu.pojo.AccessdetailExample.Criteria;
import com.gxc.stu.service.AccessDetailService;

import utils.IpAddressUtils;
import utils.Page;

@Service
public class AccessDetailServiceImpl implements AccessDetailService {

	@Autowired
	private AccessdetailMapper accessdetailMapper;
	
	@Override
	public void addAccessDetail(Accessdetail accessdetail) {
		//补全信息,获取ip所在地
		String ipAddress= "";
		try {
			ipAddress = IpAddressUtils.getIpAddress(accessdetail.getIp());
		} catch (Exception e) {
			e.printStackTrace();
		}
		accessdetail.setIplocation(ipAddress);
		accessdetail.setComedate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		//插入到数据库
		accessdetailMapper.insert(accessdetail);
	}

	@Override
	public Accessdetail findDetailByIpAndDate(String ip, String date) {
		AccessdetailExample example = new AccessdetailExample();
		//添加查询条件
		example.createCriteria().andIpEqualTo(ip).andComedateLike("%"+date+"%");
		List<Accessdetail> list = this.accessdetailMapper.selectByExample(example);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Page<Accessdetail> findAccessDetailListByCondition(
			Accessdetail accessDetail, Integer page, Integer size) {
		//分页插件
		PageHelper.startPage(page, size);
		
		//根据条件模糊查询
		AccessdetailExample example = new AccessdetailExample();
		//拼查询条件
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotBlank(accessDetail.getIp())){
			criteria.andIpLike("%"+accessDetail.getIp()+"%");
		}
		if(StringUtils.isNotBlank(accessDetail.getIplocation())){
			criteria.andIplocationLike("%"+accessDetail.getIplocation()+"%");
		}
		if(StringUtils.isNotBlank(accessDetail.getResourcepath())){
			criteria.andResourcepathLike("%"+accessDetail.getResourcepath()+"%");
		}
		if(StringUtils.isNotBlank(accessDetail.getComedate())){
			criteria.andComedateLike("%"+accessDetail.getComedate()+"%");
		}
		
		//根据comedate逆序
		example.setOrderByClause("comedate desc");
		
		//执行查询
		List<Accessdetail> list = accessdetailMapper.selectByExample(example);
		
		//获取分页信息(总记录数)
		PageInfo<Accessdetail> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		
		//封装数据
		Page<Accessdetail> result = new Page<>();
		result.setPage(page);
		result.setRows(list);
		result.setSize(size);
		result.setTotal((int)total);
		return result;
	}

	@Override
	public void deleteAccessDetailById(Integer id) {
		accessdetailMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Accessdetail findDetailByIpAndDateAndUri(String ip, String comeDate, String uri) {
		AccessdetailExample example = new AccessdetailExample();
		Criteria criteria = example.createCriteria();
		criteria.andIpEqualTo(ip);
		criteria.andComedateLike("%"+comeDate+"%");
		criteria.andResourcepathEqualTo(uri);
		List<Accessdetail> list = accessdetailMapper.selectByExample(example);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

}
