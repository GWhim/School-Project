package com.ggg.bs.services;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ITestItemService {

     public int insertTestItem(String vId, String uId,String textarea,String testId,String cstmtitle);

     List<Map<String,Object>> getTestItemByTestId(String testId);

     int updateTestItemStatus(int status,String testItemId,String userId);
}
