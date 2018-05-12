package com.gxc.stu.mapper;

import com.gxc.stu.pojo.Accesscount;
import com.gxc.stu.pojo.AccesscountExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccesscountMapper {
    int countByExample(AccesscountExample example);

    int deleteByExample(AccesscountExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Accesscount record);

    int insertSelective(Accesscount record);

    List<Accesscount> selectByExample(AccesscountExample example);

    Accesscount selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Accesscount record, @Param("example") AccesscountExample example);

    int updateByExample(@Param("record") Accesscount record, @Param("example") AccesscountExample example);

    int updateByPrimaryKeySelective(Accesscount record);

    int updateByPrimaryKey(Accesscount record);
}