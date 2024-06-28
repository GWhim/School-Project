package com.ggg.bs.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Work {

  private String id;
  private String versionId;
  private String userId;
  private String createuserId;
  private java.sql.Timestamp createtime;
  private String enduserId;
  private java.sql.Timestamp endtime;
  private String des;
  private String workId;
  private String status;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getVersionId() {
    return versionId;
  }

  public void setVersionId(String versionId) {
    this.versionId = versionId;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getCreateuserId() {
    return createuserId;
  }

  public void setCreateuserId(String createuserId) {
    this.createuserId = createuserId;
  }


  public String getDes() {
    return des;
  }

  public void setDes(String des) {
    this.des = des;
  }


  public String getWorkId() {
    return workId;
  }

  public void setWorkId(String workId) {
    this.workId = workId;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }

  public String getEnduserId() {
    return enduserId;
  }

  public void setEnduserId(String enduserId) {
    this.enduserId = enduserId;
  }

  public Timestamp getEndtime() {
    return endtime;
  }

  public void setEndtime(Timestamp endtime) {
    this.endtime = endtime;
  }
}
