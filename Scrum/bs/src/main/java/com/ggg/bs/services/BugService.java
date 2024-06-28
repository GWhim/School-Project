package com.ggg.bs.services;

import com.ggg.bs.mapper.BugMapper;
import com.ggg.bs.mapper.UserMapper;
import com.ggg.bs.model.Bug;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BugService implements IBugService{
    @Autowired
    private BugMapper bugMapper;
    public int getBugNumByUserId(String userId){
    return bugMapper.getBugNumByUserId(userId);
    }
    public int getDoneNumByUserId(String userId){
        return bugMapper.getDoneNumByUserId(userId);
    }
    public Bug selectbugbyId(String id){return bugMapper.selectbugbyId(id);}
    public int addbugbyzj(@Param("loginUserId")String loginUserId, @Param("toUserId")String toUserId, @Param("bug")Bug bug){return bugMapper.addbugbyzj(loginUserId,toUserId,bug);}
    public List<Map<String,Object>> getAllBugByUser(String userId, String starttime, String endtime, String vId, String pId){
        return bugMapper.getAllBugByUser(userId,starttime,endtime,vId,pId);
    }
    public int addBug(String vId,String userId,String createUserId,String des){
        return bugMapper.addBug(vId, userId, createUserId, des);
    }

    public int updateBugStauts(@Param("bugId")String bugId,@Param("status")String status,@Param("userId")String userId){
        return bugMapper.updateBugStauts(bugId, status, userId);
    }
}
