package com.ggg.bs.services;

import com.ggg.bs.model.File;
import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IFileService {
     public List<Map<String,Object>> getFlieByUV(String uId,String vId,int type);
     List<Map<String,Object>>  getCsFlieByUV(@Param("uId")String uId, @Param("vId")String vId, @Param("type")int type);
     int insertFile(File file);
     File getFlieById(String fId);
}
