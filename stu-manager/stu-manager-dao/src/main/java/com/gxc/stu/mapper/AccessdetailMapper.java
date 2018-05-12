package com.gxc.stu.mapper;

import com.gxc.stu.pojo.Accessdetail;
import com.gxc.stu.pojo.AccessdetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccessdetailMapper {
    int countByExample(AccessdetailExample example);

    int deleteByExample(AccessdetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Accessdetail record);

    int insertSelective(Accessdetail record);

    List<Accessdetail> selectByExample(AccessdetailExample example);

    Accessdetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Accessdetail record, @Param("example") AccessdetailExample example);

    int updateByExample(@Param("record") Accessdetail record, @Param("example") AccessdetailExample example);

    int updateByPrimaryKeySelective(Accessdetail record);

    int updateByPrimaryKey(Accessdetail record);
}