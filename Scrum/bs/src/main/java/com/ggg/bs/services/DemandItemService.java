package com.ggg.bs.services;

import com.ggg.bs.mapper.DemandItemMapper;
import com.ggg.bs.mapper.DemandMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DemandItemService implements IDemandItemService{

@Autowired
    private DemandItemMapper demandItemMapper;

    public List<Map<String,Object>> getDemandItemBydemandId(String demandId){
        return demandItemMapper.getDemandItemBydemandId(demandId);
    }
    public int insertDemandItem(@Param("vId") String vId, @Param("uId") String uId, @Param("textarea")String textarea, @Param("demandId")String demandId, @Param("xqtmtitle")String xqtmtitle){
        return demandItemMapper.insertDemandItem(vId, uId, textarea, demandId, xqtmtitle);
    }
    public int updateDemandItemStatus(int status,String demandItemId,String userId){
        return demandItemMapper.updateDemandItemStatus(status,demandItemId,userId);
    }
}
