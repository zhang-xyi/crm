package com.powernode.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * t_deal_stage
 * @author 
 */
public class DealStage implements Serializable {
    private Integer stageId;

    /**
     * 交易id
     */
    private Integer dealId;

    /**
     * 阶段名称
     */
    private String stageName;

    /**
     * 阶段状态(0 可用，1 不可用)
     */
    private Integer stageStatus;

    /**
     * 金额
     */
    private Double stageAmont;

    /**
     * 预计成交日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date stagePlanDate;

    /**
     * 是否当前阶段
     */
    private Integer isCurrent = 0;

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

    public Integer getStageId() {
        return stageId;
    }

    public void setStageId(Integer stageId) {
        this.stageId = stageId;
    }

    public Integer getDealId() {
        return dealId;
    }

    public void setDealId(Integer dealId) {
        this.dealId = dealId;
    }

    public String getStageName() {
        return stageName;
    }

    public void setStageName(String stageName) {
        this.stageName = stageName;
    }

    public Integer getStageStatus() {
        return stageStatus;
    }

    public void setStageStatus(Integer stageStatus) {
        this.stageStatus = stageStatus;
    }

    public Double getStageAmont() {
        return stageAmont;
    }

    public void setStageAmont(Double stageAmont) {
        this.stageAmont = stageAmont;
    }

    public Date getStagePlanDate() {
        return stagePlanDate;
    }

    public void setStagePlanDate(Date stagePlanDate) {
        this.stagePlanDate = stagePlanDate;
    }

    public Integer getIsCurrent() {
        return isCurrent;
    }

    public void setIsCurrent(Integer isCurrent) {
        this.isCurrent = isCurrent;
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