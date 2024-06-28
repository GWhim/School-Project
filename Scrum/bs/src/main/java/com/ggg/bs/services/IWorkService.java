package com.ggg.bs.services;

import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IWorkService {
    int getWorkNumByUserId(String userId);
    int getDoneWorkNumByUserId(String userId);
    List<Map<String,Object>> getDoingWorkByUV(String userId, String versionId);
    int zjDoing(List<Map> list ,  String loginUserId);
    List<Map<String,Object>> toNewVersion(String pId);
    List<Map<String,Object>>getAllWorkByUser(String userId,String starttime,String endtime,String vId,String pId);
    int addWork(String vId,String userId,String createUserId,String des);
    int updateWorkStauts(String workId,String status,String userId);
    int addworkbyzj(String loginUserId,String toUserId,Work work);
    Work selectworkbyId(String id);
}
