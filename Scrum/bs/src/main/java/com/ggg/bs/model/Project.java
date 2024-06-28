package com.ggg.bs.model;

import lombok.Data;

@Data
public class Project {

  private String id;
  private String name;
  private String dec;
  private String createuserId;
  private java.sql.Timestamp createtime;
  private String enduserId;
  private java.sql.Timestamp endtime;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getDec() {
    return dec;
  }

  public void setDec(String dec) {
    this.dec = dec;
  }


  public String getCreateuserId() {
    return createuserId;
  }

  public void setCreateuserId(String createuserId) {
    this.createuserId = createuserId;
  }


  public java.sql.Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(java.sql.Timestamp createtime) {
    this.createtime = createtime;
  }


  public String getEnduserId() {
    return enduserId;
  }

  public void setEnduserId(String enduserId) {
    this.enduserId = enduserId;
  }


  public java.sql.Timestamp getEndtime() {
    return endtime;
  }

  public void setEndtime(java.sql.Timestamp endtime) {
    this.endtime = endtime;
  }

}
