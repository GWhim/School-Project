package com.ggg.bs.services;

import com.ggg.bs.model.Bug;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IBugService {
    int getBugNumByUserId(String userId);
    int getDoneNumByUserId(String userId);
    Bug selectbugbyId(String id);
    int addbugbyzj(@Param("loginUserId")String loginUserId, @Param("toUserId")String toUserId, @Param("bug")Bug bug);
    List<Map<String,Object>> getAllBugByUser(String userId, String starttime, String endtime, String vId, String pId);
    int addBug(String vId,String userId,String createUserId,String des);
    int updateBugStauts(@Param("bugId")String bugId,@Param("status")String status,@Param("userId")String userId);
}
