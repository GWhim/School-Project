package com.ggg.bs.services;

import com.ggg.bs.model.Czjl;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ICzjlService {
    List<Czjl> getCzjlByUserId(String userId,int type);
    int insertCzjl(@Param("userId")String userId ,  @Param("list")List<Czjl> list);
}
