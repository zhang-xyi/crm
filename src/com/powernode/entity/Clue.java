package com.powernode.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * t_clue
 * @author 
 */
public class Clue implements Serializable {
    private Integer clueId;

    /**
     * 市场活动的id
     */
    private Integer activityId;
    private MarketActivity marketActivity;
    private Employee creator;
    private Employee updator;

    /**
     * 线索名称
     */
    private String clueTitle;

    /**
     * 线索内容
     */
    private String clueContent;

    /**
     * 线索提供人
     */
    private String clueName;

    /**
     * 线索提供人电话
     */
    private String cluePhone;

    /**
     * 线索意向公司
     */
    private String clueCompany;

    /**
     * 线索意向公司网站
     */
    private String clueCompanyNet;

    /**
     * 线索意向公司地址
     */
    private String clueCompanyAdress;

    /**
     * 线索意向人
     */
    private String cluePurposeName;

    /**
     * 线索意向人的职位
     */
    private String cluePurposeJob;

    /**
     * 线索意向人电话
     */
    private String cluePurposeMobelPhone;

    /**
     * 线索意向人座机
     */
    private String cluePurposePhone;

    /**
     * 线索意向人邮箱
     */
    private String cluePurposeMail;

    /**
     * 线索状态
     */
    private Integer clueStatus;

    /**
     * 线索来源
     */
    private Integer clueSource;

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

    public Integer getClueId() {
        return clueId;
    }

    public void setClueId(Integer clueId) {
        this.clueId = clueId;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public String getClueTitle() {
        return clueTitle;
    }

    public void setClueTitle(String clueTitle) {
        this.clueTitle = clueTitle;
    }

    public String getClueContent() {
        return clueContent;
    }

    public void setClueContent(String clueContent) {
        this.clueContent = clueContent;
    }

    public String getClueName() {
        return clueName;
    }

    public void setClueName(String clueName) {
        this.clueName = clueName;
    }

    public String getCluePhone() {
        return cluePhone;
    }

    public void setCluePhone(String cluePhone) {
        this.cluePhone = cluePhone;
    }

    public String getClueCompany() {
        return clueCompany;
    }

    public void setClueCompany(String clueCompany) {
        this.clueCompany = clueCompany;
    }

    public String getClueCompanyNet() {
        return clueCompanyNet;
    }

    public void setClueCompanyNet(String clueCompanyNet) {
        this.clueCompanyNet = clueCompanyNet;
    }

    public String getClueCompanyAdress() {
        return clueCompanyAdress;
    }

    public void setClueCompanyAdress(String clueCompanyAdress) {
        this.clueCompanyAdress = clueCompanyAdress;
    }

    public String getCluePurposeName() {
        return cluePurposeName;
    }

    public void setCluePurposeName(String cluePurposeName) {
        this.cluePurposeName = cluePurposeName;
    }

    public String getCluePurposeJob() {
        return cluePurposeJob;
    }

    public void setCluePurposeJob(String cluePurposeJob) {
        this.cluePurposeJob = cluePurposeJob;
    }

    public String getCluePurposeMobelPhone() {
        return cluePurposeMobelPhone;
    }

    public void setCluePurposeMobelPhone(String cluePurposeMobelPhone) {
        this.cluePurposeMobelPhone = cluePurposeMobelPhone;
    }

    public String getCluePurposePhone() {
        return cluePurposePhone;
    }

    public void setCluePurposePhone(String cluePurposePhone) {
        this.cluePurposePhone = cluePurposePhone;
    }

    public String getCluePurposeMail() {
        return cluePurposeMail;
    }

    public void setCluePurposeMail(String cluePurposeMail) {
        this.cluePurposeMail = cluePurposeMail;
    }

    public Integer getClueStatus() {
        return clueStatus;
    }

    public void setClueStatus(Integer clueStatus) {
        this.clueStatus = clueStatus;
    }

    public Integer getClueSource() {
        return clueSource;
    }

    public void setClueSource(Integer clueSource) {
        this.clueSource = clueSource;
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

    public MarketActivity getMarketActivity() {
        return marketActivity;
    }

    public void setMarketActivity(MarketActivity marketActivity) {
        this.marketActivity = marketActivity;
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
}