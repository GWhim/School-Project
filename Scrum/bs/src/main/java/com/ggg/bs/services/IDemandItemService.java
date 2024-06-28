package com.ggg.bs.services;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IDemandItemService {

     public int insertDemandItem(@Param("vId") String vId, @Param("uId") String uId, @Param("textarea")String textarea, @Param("demandId")String demandId, @Param("xqtmtitle")String xqtmtitle);

     List<Map<String,Object>> getDemandItemBydemandId(String demandId);

     int updateDemandItemStatus(int status,String demandItemId,String userId);
}
