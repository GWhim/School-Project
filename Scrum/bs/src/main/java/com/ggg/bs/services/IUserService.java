package com.ggg.bs.services;

import com.ggg.bs.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IUserService {
     List<User> getUserList();
     List<User> getUserList(User user);
     User getUserByUserAccountAndPassword(String account ,String pwd) ;
     User getUserById(String id ) ;
     Boolean UpdateUserPwdById(String id, String pwd);
     List<Map<String, Object>> getAllUser(String versionId);
     List<Map<String, Object>> getAllVUser(String versionId);
     List<Map<String, Object>> getAllUserByPId (String pId);
}
