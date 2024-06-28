package com.ggg.bs.services;

import com.ggg.bs.mapper.FileMapper;
import com.ggg.bs.mapper.UserMapper;
import com.ggg.bs.model.File;
import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class FileService implements IFileService{

@Autowired
    private FileMapper fileMapper;

    public List<Map<String,Object>> getFlieByUV(String uId,String vId,int type){
        return fileMapper.getFlieByUV(uId,vId,type);
    }
    public int insertFile(File file){
        return fileMapper.insert(file);
    }
    public File getFlieById(String fId){
        return fileMapper.getFlieById(fId);
    }
    public List<Map<String,Object>>  getCsFlieByUV(@Param("uId")String uId, @Param("vId")String vId, @Param("type")int type){
        return fileMapper.getCsFlieByUV(uId,vId,type);
    }
}
