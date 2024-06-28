package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.User;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface WorkMapper extends BaseMapper<Work> {

   public int getWorkNumByUserId(String userId);
   public int getDoneWorkNumByUserId(String userId);
   public List<Map<String,Object>> getDoingWorkByUV(String userId, String versionId);
   public int zjDoing(@Param("list")List<Map> list ,@Param("loginUserId") String loginUserId);
   List<Map<String,Object>> toNewVersion(String pId);
   List<Map<String,Object>>getAllWorkByUser(@Param("userId") String userId,@Param("starttime")String starttime,@Param("endtime")String endtime,@Param("vId")String vId,@Param("pId")String pId);
   int addWork(String vId,String userId,String createUserId,String des);
   int updateWorkStauts(@Param("workId")String workId,@Param("status")String status,@Param("userId")String userId);
   int addworkbyzj(@Param("loginUserId")String loginUserId,@Param("toUserId")String toUserId,@Param("work") Work work);
   Work selectworkbyId(String id);
}