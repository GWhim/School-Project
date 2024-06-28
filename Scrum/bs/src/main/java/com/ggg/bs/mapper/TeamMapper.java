package com.ggg.bs.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ggg.bs.model.Team;
import com.ggg.bs.model.User;
import com.ggg.bs.model.Work;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface TeamMapper extends BaseMapper<Team> {

   public List<Map<String, Object>> getCyglTable(String versionId);
   public int addUser(@Param("list")List<User> list,@Param("versionId") String versionId);

   public int updateTeamUserSfyx(@Param("list")List<User> list,@Param("versionId") String versionId,@Param("sfyx")int sfyx);
   public int selectOneByUV(@Param("userId") String userId,@Param("versionId") String versionId);
   public List<Map<String, Object>>selectTeamByPid(String pId);
   List<Map<String, Object>> selectTeamByUV(String userId,String vId);

}