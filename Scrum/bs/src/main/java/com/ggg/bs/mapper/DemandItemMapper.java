package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Demand;
import com.ggg.bs.model.DemandItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface DemandItemMapper extends BaseMapper<DemandItem> {


   public int insertDemandItem(@Param("vId") String vId, @Param("uId") String uId,@Param("textarea")String textarea,@Param("demandId")String demandId,@Param("xqtmtitle")String xqtmtitle);
   List<Map<String,Object>>getDemandItemBydemandId(String demandId);
   int updateDemandItemStatus(@Param("status")int status,@Param("demandItemId")String demandItemId,@Param("userId")String userId);
}