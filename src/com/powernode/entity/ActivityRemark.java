package com.powernode.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * t_activity_remark
 * @author 
 */
public class ActivityRemark implements Serializable {
    private Integer remarkId;

    private Integer activityId;

    private String remarkTitle;

    private String remarkContent;

    /**
     * 创建人
     */
    private Integer createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改人
     */
    private Integer updateBy;

    /**
     * 修改时间
     */
    private Date updateTime;



    private static final long serialVersionUID = 1L;

    public Integer getRemarkId() {
        return remarkId;
    }

    public void setRemarkId(Integer remarkId) {
        this.remarkId = remarkId;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public String getRemarkTitle() {
        return remarkTitle;
    }

    public void setRemarkTitle(String remarkTitle) {
        this.remarkTitle = remarkTitle;
    }

    public String getRemarkContent() {
        return remarkContent;
    }

    public void setRemarkContent(String remarkContent) {
        this.remarkContent = remarkContent;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}