package com.ggg.bs.services;

import com.ggg.bs.model.Project;

import java.util.List;
import java.util.Map;

public interface IProjectService {
     List<Map<String, Object>> kbProject(String userId);
     List<Map<String, Object>> xmglData(String userId);
     int addProject(String pId,String userId,String pName,String dec);
     int closeP(String userId,String pId);
     Project selectProjectById(String pId);
     List<Map<String, Object>> selectProjectByUser(String userId);
}
