package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.DemandItem;
import com.ggg.bs.model.TestItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface TestItemMapper extends BaseMapper<TestItem> {


   int insertTestItem(@Param("vId") String vId, @Param("uId") String uId, @Param("textarea") String textarea, @Param("testId") String testId, @Param("cstmtitle") String cstmtitle);
   List<Map<String,Object>>getTestItemByTestId(String testId);
   int updateTestItemStatus(@Param("status") int status, @Param("testItemId") String testItemId, @Param("userId") String userId);
}