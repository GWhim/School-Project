package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Czjl;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CzjlMapper extends BaseMapper<Czjl> {

   public List<Czjl> getCzjlByUserId(@Param("userId")String userId,@Param("type") int type);
   public  int insertCzjl(@Param("userId")String userId ,@Param("list")List<Czjl> list);
}