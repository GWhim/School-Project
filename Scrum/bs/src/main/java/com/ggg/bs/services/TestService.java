package com.ggg.bs.services;

import com.ggg.bs.mapper.DemandMapper;
import com.ggg.bs.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService implements ITestService{

@Autowired
    private TestMapper testMapper;

    public  int insertTest(String fId,String vId){
        return testMapper.insertTest(fId,vId);
    }
}
