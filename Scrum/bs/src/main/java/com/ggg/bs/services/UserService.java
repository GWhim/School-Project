package com.ggg.bs.services;

import com.ggg.bs.mapper.UserMapper;
import com.ggg.bs.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements IUserService{

@Autowired
    private UserMapper userMapper;

    public List<User> getUserList(){
        return userMapper.getUserList();
    }
    public List<User> getUserList(User user){
        return userMapper.getUserList();
    }
    public User getUserByUserAccountAndPassword(String account ,String pwd) {
        return userMapper.getUserByUserAccountAndPassword(account,pwd);
    }
    public User getUserById(String id ) {
        return userMapper.getUserById(id);
    }
    public Boolean UpdateUserPwdById(String id, String pwd)
    {
         userMapper.UpdateUserPwdById(id,pwd);
         return true;
    }
    public List<Map<String, Object>> getAllVUser(String versionId){
        return userMapper.getAllVUser(versionId);
    }
    public List<Map<String, Object>> getAllUser(String versionId){
        return userMapper.getAllUser(versionId);
    }
    public List<Map<String, Object>> getAllUserByPId (String pId){
        return userMapper.getAllUserByPId(pId);
    }
}
