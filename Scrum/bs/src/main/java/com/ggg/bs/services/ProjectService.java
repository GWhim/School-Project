package com.ggg.bs.services;

import com.ggg.bs.mapper.ProjectMapper;
import com.ggg.bs.mapper.WorkMapper;
import com.ggg.bs.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProjectService implements IProjectService{
    @Autowired
    private ProjectMapper projectMapper;
    public List<Map<String, Object>> kbProject(String userId){
    return projectMapper.kbProject(userId);
    }
    public List<Map<String, Object>> xmglData(String userId){
        return projectMapper.xmglData(userId);
    }
    public int addProject(String pId, String userId,String pName,String dec){
        return projectMapper.addProject( pId,userId,pName,dec);
    }
    public int closeP(String userId ,String pId){
        return projectMapper.closeP(userId,pId);
    }
    public Project selectProjectById(String pId){
        return projectMapper.selectProjectById(pId);
    }
    public List<Map<String, Object>> selectProjectByUser(String userId){
        return projectMapper.selectProjectByUser(userId);
    }
}
