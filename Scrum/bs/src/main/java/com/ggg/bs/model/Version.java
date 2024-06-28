package com.ggg.bs.model;

import lombok.Data;

@Data
public class Version {

  private String id;
  private String projectId;
  private String name;
  private long status;
  private java.sql.Timestamp createtime;
  private String creatuserId;
  private String enduserId;
  private java.sql.Timestamp endtime;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getProjectId() {
    return projectId;
  }

  public void setProjectId(String projectId) {
    this.projectId = projectId;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }


  public java.sql.Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(java.sql.Timestamp createtime) {
    this.createtime = createtime;
  }


  public String getCreatuserId() {
    return creatuserId;
  }

  public void setCreatuserId(String creatuserId) {
    this.creatuserId = creatuserId;
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
