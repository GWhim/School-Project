package com.ggg.bs.services;

import com.ggg.bs.mapper.VersionMapper;
import com.ggg.bs.mapper.WorkMapper;
import com.ggg.bs.model.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class VersionService implements IVersionService{
    @Autowired
    private VersionMapper versionMapper;
    public int getVersionNumByUserId(String userId){
    return versionMapper.getVersionNumByUserId(userId);
    }
    public List<Map<String, Object>> getVersionByUserId(String userId)
    {
        return versionMapper.getVersionByUserId(userId);
    }
    public Version getVersionById(String id){
        return versionMapper.getVersionById(id);
    }
    public    int addVersion(String vId,String pId,String vName,String userId){
        return  versionMapper.addVersion(vId,pId,vName,userId);
    }
    public List<Map<String, Object>> getVersionByPId(String pId)
    {return versionMapper.getVersionByPId(pId);}
    public int updateVersionStatus(String pId,String userId){
       return versionMapper.updateVersionStatus(pId, userId);
    }
    public  int closeVersionStatus(String pId,String userId){
        return versionMapper.closeVersionStatus(pId, userId);
    }
    public  List<Map<String, Object>> getAllVersionByUser(String userId){
        return versionMapper.getAllVersionByUser(userId);
    }
}
