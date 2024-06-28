package com.ggg.bs.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class TestItem {

  private String id;
  private String versionId;
  private String createuserId;
  private Timestamp createtime;
  private long status;
  private String enduserId;
  private Timestamp endtime;
  private String des;
  private String testId;
  private String  title;

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

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

  public String getCreateuserId() {
    return createuserId;
  }

  public void setCreateuserId(String createuserId) {
    this.createuserId = createuserId;
  }


  public Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }

  public String getDes() {
    return des;
  }

  public void setDes(String des) {
    this.des = des;
  }

  public String getTestId() {
    return testId;
  }

  public void setTestId(String testId) {
    this.testId = testId;
  }
}
