package com.gxc.stu.service;

import com.gxc.stu.pojo.Accessdetail;
import utils.Page;

public interface AccessDetailService {

	/**
	 * 添加访问详情
	 * @param accessdetail
	 */
	void addAccessDetail(Accessdetail accessdetail);

	/**
	 * 根据ip和时间查询
	 * @param ip
	 * @param date
	 * @return
	 */
	Accessdetail findDetailByIpAndDate(String ip, String date);

	/**
	 * 根据条件查询访问详情列表
	 * @param accessDetail
	 * @param page
	 * @param size
	 * @return
	 */
	Page<Accessdetail> findAccessDetailListByCondition(Accessdetail accessDetail, Integer page, Integer size);

	/**
	 * 删除
	 * @param id
	 */
	void deleteAccessDetailById(Integer id);

}
