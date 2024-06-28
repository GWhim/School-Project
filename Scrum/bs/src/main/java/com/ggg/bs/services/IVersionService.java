package com.ggg.bs.services;

import com.ggg.bs.model.Version;

import java.util.List;
import java.util.Map;

public interface IVersionService {
    int getVersionNumByUserId(String userId);
    List<Map<String, Object>>  getVersionByUserId(String userId);
    Version getVersionById(String id);
    int addVersion(String vId,String pId,String vName,String userId);
    List<Map<String, Object>> getVersionByPId(String pId);
    int updateVersionStatus(String pId,String userId);
    int closeVersionStatus(String pId,String userId);
    List<Map<String, Object>> getAllVersionByUser(String userId);
}
