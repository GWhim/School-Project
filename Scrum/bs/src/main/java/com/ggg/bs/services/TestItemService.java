package com.ggg.bs.services;

import com.ggg.bs.mapper.DemandItemMapper;
import com.ggg.bs.mapper.TestItemMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TestItemService implements ITestItemService{

@Autowired
    private TestItemMapper testItemMapper;

    public List<Map<String,Object>> getTestItemByTestId(String testId){
        return testItemMapper.getTestItemByTestId(testId);
    }
    public int insertTestItem(String vId, String uId,String textarea,String testId,String cstmtitle){
        return testItemMapper.insertTestItem(vId, uId, textarea, testId, cstmtitle);
    }
    public int updateTestItemStatus(int status,String testItemId,String userId){
        return testItemMapper.updateTestItemStatus(status,testItemId,userId);
    }
}
