package com.ggg.bs.services;

import com.ggg.bs.mapper.DemandMapper;
import com.ggg.bs.mapper.FileMapper;
import com.ggg.bs.model.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DemandService implements IDemandService{

@Autowired
    private DemandMapper demandMapper;

    public  int insertDemand(String fId,String vId){
        return demandMapper.insertDemand(fId,vId);
    }
}
