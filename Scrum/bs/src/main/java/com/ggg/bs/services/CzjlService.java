package com.ggg.bs.services;

import com.ggg.bs.mapper.CzjlMapper;
import com.ggg.bs.mapper.WorkMapper;
import com.ggg.bs.model.Czjl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CzjlService implements ICzjlService{
    @Autowired
    private CzjlMapper czjlMapper;
    public List<Czjl> getCzjlByUserId(String userId,int type){
    return czjlMapper.getCzjlByUserId(userId,type);
    }
    public int insertCzjl(@Param("userId")String userId , @Param("list")List<Czjl> list)
    {
       return czjlMapper.insertCzjl(userId,list);
    }
}
