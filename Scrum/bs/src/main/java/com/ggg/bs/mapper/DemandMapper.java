package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Demand;
import com.ggg.bs.model.File;
import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface DemandMapper extends BaseMapper<Demand> {


   public int insertDemand(@Param("fId") String fId, @Param("vId") String vId);

}