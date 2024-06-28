package com.ggg.bs.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class File {

  private String id;
  private String name;
  private String orthername;
  private String path;
  private String userId;
  private long type;
  private java.sql.Timestamp createtime;
  private String versionId;


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


  public String getOrthername() {
    return orthername;
  }

  public void setOrthername(String orthername) {
    this.orthername = orthername;
  }


  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public long getType() {
    return type;
  }

  public void setType(long type) {
    this.type = type;
  }


  public java.sql.Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(java.sql.Timestamp createtime) {
    this.createtime = createtime;
  }


  public String getVersionId() {
    return versionId;
  }

  public void setVersionId(String versionId) {
    this.versionId = versionId;
  }

  public File(String id, String name, String orthername, String path, String userId, long type, Timestamp createtime, String versionId) {
    this.id = id;
    this.name = name;
    this.orthername = orthername;
    this.path = path;
    this.userId = userId;
    this.type = type;
    this.createtime = createtime;
    this.versionId = versionId;
  }
}
