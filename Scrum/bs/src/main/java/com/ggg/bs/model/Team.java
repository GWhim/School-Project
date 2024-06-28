package com.ggg.bs.model;

import lombok.Data;

@Data
public class Team {

  private String id;
  private String versionId;
  private String userId;
  private long sfyx;


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

  public long getSfyx() {
    return sfyx;
  }

  public void setSfyx(long sfyx) {
    this.sfyx = sfyx;
  }
}
