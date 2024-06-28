package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.File;
import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface FileMapper extends BaseMapper<File> {

   public List<Map<String,Object>> getFlieByUV(@Param("uId")String uId,@Param("vId")String vId,@Param("type")int type);
   List<Map<String,Object>>  getCsFlieByUV(@Param("uId")String uId,@Param("vId")String vId,@Param("type")int type);
   public User getUserByUserAccountAndPassword(@Param("account") String account, @Param("pwd") String pwd);
   public User getUserById(String id);
   Boolean UpdateUserPwdById(@Param("id") String id, @Param("pwd") String pwd);
   List<Map<String, Object>> getAllUser(String versionId);
   List<Map<String, Object>> getAllUserByPId(String pId);
   List<Map<String, Object>>    getAllVUser(String versionId);
   File getFlieById(String fId);
}