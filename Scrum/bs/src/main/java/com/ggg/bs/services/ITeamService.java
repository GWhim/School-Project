package com.ggg.bs.services;

import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ITeamService {
    List<Map<String, Object>> getCyglTable(String userId);
    int addUser(List<User> list, String versionId);
    int updateTeamUserSfyx(List<User> list,String versionId,int sfyx);
    int selectOneByUV(String userId,String versionId);
    List<Map<String, Object>>selectTeamByPid(String pId);
    List<Map<String, Object>> selectTeamByUV(String userId,String vId);
}
