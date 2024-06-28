package com.ggg.bs.model;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
public class Bug  {

  private String id;
  private String versionId;
  private String creatuser;
  private java.sql.Timestamp createtime;
  private String enduser;
  private java.sql.Timestamp endtime;
  private long status;
  private String userId;
  private String bugId;
  private String des;


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


  public String getCreatuser() {
    return creatuser;
  }

  public void setCreatuser(String creatuser) {
    this.creatuser = creatuser;
  }


  public java.sql.Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(java.sql.Timestamp createtime) {
    this.createtime = createtime;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(long status) {
    this.status = status;
  }


  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }


  public String getBugId() {
    return bugId;
  }

  public void setBugId(String bugId) {
    this.bugId = bugId;
  }

  public String getEnduser() {
    return enduser;
  }

  public void setEnduser(String enduser) {
    this.enduser = enduser;
  }

  public Timestamp getEndtime() {
    return endtime;
  }

  public void setEndtime(Timestamp endtime) {
    this.endtime = endtime;
  }

  public String getDes() {
    return des;
  }

  public void setDes(String des) {
    this.des = des;
  }
}
