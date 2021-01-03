package com.powernode.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * t_customer_link_record
 * @author 
 */
public class CustomerLinkRecord implements Serializable {
    /**
     * 联系记录id
     */
    private Integer recordId;

    /**
     * 联系人id
     */
    private Integer linkmanId;

    /**
     * 联系内容
     */
    private String recordContent;

    /**
     * 联系时间
     */
    private Date recordDate;

    /**
     * 0 电联，1 邮联，2 上门拜访，3 微信, 4 qq
     */
    private Integer recordWay;

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

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getLinkmanId() {
        return linkmanId;
    }

    public void setLinkmanId(Integer linkmanId) {
        this.linkmanId = linkmanId;
    }

    public String getRecordContent() {
        return recordContent;
    }

    public void setRecordContent(String recordContent) {
        this.recordContent = recordContent;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public Integer getRecordWay() {
        return recordWay;
    }

    public void setRecordWay(Integer recordWay) {
        this.recordWay = recordWay;
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