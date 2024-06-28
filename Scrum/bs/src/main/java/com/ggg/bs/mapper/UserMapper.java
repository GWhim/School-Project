package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.User;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper extends BaseMapper<User> {

   public List<User> getUserList();
   public User getUserByUserAccountAndPassword(@Param("account") String account ,@Param("pwd")String pwd);
   public User getUserById(String id);
   Boolean UpdateUserPwdById(@Param("id")String id,@Param("pwd")String pwd);
   List<Map<String, Object>> getAllUser(String versionId);
   List<Map<String, Object>> getAllUserByPId (String pId);
   List<Map<String, Object>>    getAllVUser (String versionId);
}