package com.ggg.bs.services;

import com.ggg.bs.mapper.TeamMapper;
import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TeamService implements ITeamService{
    @Autowired
    private TeamMapper teamMapper;
    public List<Map<String, Object>> getCyglTable(String versionId){
    return teamMapper.getCyglTable(versionId);
    }
    public int addUser(List<User> list,String versionId){
        return teamMapper.addUser(list,versionId);
    }
    public int updateTeamUserSfyx(List<User> list,String versionId,int sfyx){
        return teamMapper.updateTeamUserSfyx(list,versionId,sfyx);
    }
    public int selectOneByUV(String userId,String versionId){
        return teamMapper.selectOneByUV(userId,versionId);
    }
    public List<Map<String, Object>>selectTeamByPid(String pId){
        return teamMapper.selectTeamByPid(pId);
    }
    public List<Map<String, Object>> selectTeamByUV(String userId,String vId){
        return teamMapper.selectTeamByUV(userId,vId);
    }
}
