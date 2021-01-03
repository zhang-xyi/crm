package com.powernode.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * t_deal
 * @author 
 */
public class Deal implements Serializable {
    /**
     * 交易id
     */
    private Integer dealId;
    private DealStage dealStage;

    //线索id
    private Integer clueId;

    //市场活动id
    private Integer activityId;
    private MarketActivity marketActivity;
    private Clue clue;

    /**
     * 联系人id
     */
    private Integer linkmanId;
    private CutomerLinkman cutomerLinkman;
    private Customer customer;

    /**
     * 交易号
     */
    private String dealNo;

    /**
     * 交易名称
     */
    private String dealName;

    /**
     * 交易内容
     */
    private String dealContent;

    /**
     * 交易类型
     */
    private Integer dealType;

    /**
     * 交易实际时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dealActualDate;

    /**
     * 交易预计时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date dealPlanDate;

    /**
     * 交易金额
     */
    private Double dealAmont;

    /**
     * 来源
     */
    private Integer dealSource;

    /**
     * 交易方式
     */
    private Integer dealWay;

    private Integer dealStatus;

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

    //创建者
    private Employee creator;

    //修改者
    private Employee updator;

    /**
     * 交易要经过的阶段
     */
    private DealStage[] dealStages;

    private static final long serialVersionUID = 1L;

    public Integer getDealId() {
        return dealId;
    }

    public void setDealId(Integer dealId) {
        this.dealId = dealId;
    }

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

    public Integer getLinkmanId() {
        return linkmanId;
    }

    public void setLinkmanId(Integer linkmanId) {
        this.linkmanId = linkmanId;
    }

    public String getDealNo() {
        return dealNo;
    }

    public void setDealNo(String dealNo) {
        this.dealNo = dealNo;
    }

    public String getDealName() {
        return dealName;
    }

    public void setDealName(String dealName) {
        this.dealName = dealName;
    }

    public String getDealContent() {
        return dealContent;
    }

    public void setDealContent(String dealContent) {
        this.dealContent = dealContent;
    }

    public Integer getDealType() {
        return dealType;
    }

    public void setDealType(Integer dealType) {
        this.dealType = dealType;
    }

    public Date getDealActualDate() {
        return dealActualDate;
    }

    public void setDealActualDate(Date dealActualDate) {
        this.dealActualDate = dealActualDate;
    }

    public Date getDealPlanDate() {
        return dealPlanDate;
    }

    public void setDealPlanDate(Date dealPlanDate) {
        this.dealPlanDate = dealPlanDate;
    }

    public Double getDealAmont() {
        return dealAmont;
    }

    public void setDealAmont(Double dealAmont) {
        this.dealAmont = dealAmont;
    }

    public Integer getDealSource() {
        return dealSource;
    }

    public void setDealSource(Integer dealSource) {
        this.dealSource = dealSource;
    }

    public Integer getDealWay() {
        return dealWay;
    }

    public void setDealWay(Integer dealWay) {
        this.dealWay = dealWay;
    }

    public Integer getDealStatus() {
        return dealStatus;
    }

    public void setDealStatus(Integer dealStatus) {
        this.dealStatus = dealStatus;
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

    public DealStage[] getDealStages() {
        return dealStages;
    }

    public void setDealStages(DealStage[] dealStages) {
        this.dealStages = dealStages;
    }

    public DealStage getDealStage() {
        return dealStage;
    }

    public void setDealStage(DealStage dealStage) {
        this.dealStage = dealStage;
    }

    public CutomerLinkman getCutomerLinkman() {
        return cutomerLinkman;
    }

    public void setCutomerLinkman(CutomerLinkman cutomerLinkman) {
        this.cutomerLinkman = cutomerLinkman;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    public MarketActivity getMarketActivity() {
        return marketActivity;
    }

    public void setMarketActivity(MarketActivity marketActivity) {
        this.marketActivity = marketActivity;
    }

    public Clue getClue() {
        return clue;
    }

    public void setClue(Clue clue) {
        this.clue = clue;
    }
}