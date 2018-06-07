package com.gxc.stu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.gxc.stu.mapper.AccesscountMapper;
import com.gxc.stu.pojo.Accesscount;
import com.gxc.stu.pojo.AccesscountExample;
import com.gxc.stu.service.AccessCountService;

@Service
public class AccessCountServiceImpl implements AccessCountService {

	@Autowired
	private AccesscountMapper accesscountMapper;
	
	@Override
	public void addAccessCount(Accesscount accesscount) {
		//添加到数据库
		accesscountMapper.insert(accesscount);
	}

	@Override
	public Accesscount findAccessCountByDate(String date) {
		AccesscountExample example = new AccesscountExample();
		//添加查询条件
		example.createCriteria().andDateEqualTo(date);
		//数据库查询
		List<Accesscount> list = accesscountMapper.selectByExample(example);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void updateAccessCount(Accesscount accessCount) {
		this.accesscountMapper.updateByPrimaryKey(accessCount);
	}

	@Override
	public List<Accesscount> findAccessCountList(Integer page, Integer size) {
		PageHelper.startPage(page, size);
		//查询(分页，倒序)
		AccesscountExample example = new AccesscountExample();
		example.setOrderByClause("date desc");
		List<Accesscount> list = accesscountMapper.selectByExample(example);
		return list;
	}

}
