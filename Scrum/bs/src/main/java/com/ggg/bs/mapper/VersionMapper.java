package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Version;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface VersionMapper extends BaseMapper<Version> {

   public int getVersionNumByUserId(String userId);
   public List<Map<String, Object>> getVersionByUserId(String userId);
   Version getVersionById(String id);
   int addVersion(@Param("vId") String vId, @Param("pId") String pId, @Param("vName")String vName, @Param("userId")String userId);
   public List<Map<String, Object>> getVersionByPId(String pId);
   public int updateVersionStatus(String pId,String userId);
   int closeVersionStatus(String pId,String userId);
   List<Map<String, Object>> getAllVersionByUser(String userId);
}