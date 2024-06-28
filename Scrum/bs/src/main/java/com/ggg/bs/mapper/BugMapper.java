package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Bug;
import com.ggg.bs.model.User;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface BugMapper extends BaseMapper<Bug> {

   public int getBugNumByUserId(String userId);
   public int getDoneNumByUserId(String userId);
   Bug selectbugbyId(String id);
   int addbugbyzj(@Param("loginUserId")String loginUserId,@Param("toUserId")String toUserId,@Param("bug")Bug bug);
   List<Map<String,Object>> getAllBugByUser(@Param("userId")String userId, @Param("starttime")String starttime, @Param("endtime")String endtime, @Param("vId")String vId, @Param("pId")String pId);
   int addBug(String vId,String userId,String createUserId,String des);
   int updateBugStauts(@Param("bugId")String bugId,@Param("status")String status,@Param("userId")String userId);
}