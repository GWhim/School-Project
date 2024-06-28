package com.ggg.bs.services;

import com.ggg.bs.mapper.BugMapper;
import com.ggg.bs.mapper.WorkMapper;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class WorkService implements IWorkService{
    @Autowired
    private WorkMapper workMapper;
    public int getWorkNumByUserId(String userId){
    return workMapper.getWorkNumByUserId(userId);
    }
    public int getDoneWorkNumByUserId(String userId){
        return workMapper.getDoneWorkNumByUserId(userId);
    }
    public List<Map<String,Object>> getDoingWorkByUV(String userId, String versionId){
        return workMapper.getDoingWorkByUV(userId,versionId);
    }
    public int zjDoing(List<Map> list , String loginUserId){
        return workMapper.zjDoing(list,loginUserId);
    }
    public List<Map<String,Object>> toNewVersion(String pId){
        return  workMapper.toNewVersion(pId);
    }
    public List<Map<String,Object>>getAllWorkByUser(String userId,String starttime,String endtime,String vId,String pId){
        return workMapper.getAllWorkByUser(userId,starttime,endtime,vId,pId);
    }
    public int addWork(String vId,String userId,String createUserId,String des){
        return workMapper.addWork(vId,userId,createUserId,des);
    }
    public int updateWorkStauts(String workId,String status,String userId){
        return workMapper.updateWorkStauts(workId,status,userId);
    }
    public int addworkbyzj(String loginUserId,String toUserId,Work work){
        return  workMapper.addworkbyzj(loginUserId,toUserId,work);
    }
    public Work selectworkbyId(String id){
        return workMapper.selectworkbyId(id);
    }
}
