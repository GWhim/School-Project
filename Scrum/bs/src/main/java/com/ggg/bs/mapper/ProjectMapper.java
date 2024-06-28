package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Project;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProjectMapper extends BaseMapper<Project> {

   List<Map<String, Object>> kbProject(String userId);
   List<Map<String, Object>> xmglData(String userId);
   int addProject(@Param("pId")String pId, @Param("userId")String userId, @Param("pName")String pName, @Param("dec")String dec);
   int closeP(String userId,String pId);
   Project selectProjectById(String pId);
   List<Map<String, Object>> selectProjectByUser(String userId);
}