package com.gxc.stu.service;

import java.util.List;

import com.gxc.stu.pojo.Accesscount;

public interface AccessCountService {

	/**
	 * 添加一条访问数量的数据
	 * @param accesscount 
	 */
	void addAccessCount(Accesscount accesscount);

	/**
	 * 根据日期查询 Accesscount
	 * @param date
	 * @return
	 */
	Accesscount findAccessCountByDate(String date);

	/**
	 * 更新
	 * @param accessCount
	 */
	void updateAccessCount(Accesscount accessCount);

	/**
	 * 查询数据列表(分页)
	 * @param page
	 * @param size
	 * @return
	 */
	List<Accesscount> findAccessCountList(Integer page, Integer size);

}
