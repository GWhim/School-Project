package com.ggg.bs.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

@Data
public class Czjl {

  private String id;
  private String userId;
  private String username;
  private String des;
  private java.sql.Timestamp createtime;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getDes() {
    return des;
  }

  public void setDesc(String des) {
    this.des = des;
  }

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
  public java.sql.Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(java.sql.Timestamp createtime) {
    this.createtime = createtime;
  }


  public void setDes(String des) {
    this.des = des;
  }
}
