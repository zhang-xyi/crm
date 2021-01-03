package com.powernode.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * t_market_activity
 * @author 
 */
public class MarketActivity implements Serializable {
    private Integer activityId;

    /**
     * 活动备注
     */

    @JsonIgnore
    private List<ActivityRemark> activityRemarkList;

    /**
     * 活动名称
     */
    private String activityName;

    /**
     * 活动内容
     */
    @JsonIgnore
    private String activityContent;

    /**
     * 参于对象
     */
    @JsonIgnore
    private String activityPerson;

    /**
     * 地点
     */
    @JsonIgnore
    private String activityPlace;

    /**
     * 开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    //@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+08:00")
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+08:00")
    private Date activityStartDate;

    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    //@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+08:00")
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+08:00")
    private Date activityEndDate;

    /**
     * 活动成本
     */
    @JsonIgnore
    private Double activityCost;

    /**
     * 创建人
     */
    @JsonIgnore
    private Integer createBy;
    @JsonIgnore
    private Employee creator;

    /**
     * 查询中的所有者，开始时间，结束时间
     */
    @JsonIgnore
    private String owner;
    @JsonIgnore
    private String startTime;
    @JsonIgnore
    private String endTime;


    /**
     * 创建时间
     */
    @JsonIgnore
    private Date createTime;

    /**
     * 修改人
     */
    @JsonIgnore
    private Integer updateBy;
    @JsonIgnore
    private Employee updator;

    /**
     * 修改时间
     */
    @JsonIgnore
    private Date updateTime;

    private static final long serialVersionUID = 1L;

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getActivityContent() {
        return activityContent;
    }

    public void setActivityContent(String activityContent) {
        this.activityContent = activityContent;
    }

    public String getActivityPerson() {
        return activityPerson;
    }

    public void setActivityPerson(String activityPerson) {
        this.activityPerson = activityPerson;
    }

    public String getActivityPlace() {
        return activityPlace;
    }

    public void setActivityPlace(String activityPlace) {
        this.activityPlace = activityPlace;
    }

    public Date getActivityStartDate() {
        return activityStartDate;
    }

    public void setActivityStartDate(Date activityStartDate) {
        this.activityStartDate = activityStartDate;
    }

    public Date getActivityEndDate() {
        return activityEndDate;
    }

    public void setActivityEndDate(Date activityEndDate) {
        this.activityEndDate = activityEndDate;
    }

    public Double getActivityCost() {
        return activityCost;
    }

    public void setActivityCost(Double activityCost) {
        this.activityCost = activityCost;
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

    public Employee getCreator() {
        return creator;
    }

    public void setCreator(Employee creator) {
        this.creator = creator;
    }

    public Employee getUpdator() {
        return updator;
    }

    public void setUpdator(Employee updator) {
        this.updator = updator;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public List<ActivityRemark> getActivityRemarkList() {
        return activityRemarkList;
    }

    public void setActivityRemarkList(List<ActivityRemark> activityRemarkList) {
        this.activityRemarkList = activityRemarkList;
    }
}