package com.powernode.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * t_customer
 * @author 
 */
public class Customer implements Serializable {
    private Integer custId;



    /**
     * 客户名称
     */
    private String custName;

    /**
     * 公司网站
     */
    private String custNet;

    /**
     * 公司座机
     */
    private String custPhone;

    /**
     * 详细地址
     */
    private String custAdress;

    /**
     * 描述
     */
    private String custRemark;

    /**
     * 客户等级
     */
    private Integer custSatrt;

    /**
     * 创建人，修改人
     */
    //创建者
    private Employee creator;

    //修改者
    private Employee updator;

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

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustNet() {
        return custNet;
    }

    public void setCustNet(String custNet) {
        this.custNet = custNet;
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    public String getCustAdress() {
        return custAdress;
    }

    public void setCustAdress(String custAdress) {
        this.custAdress = custAdress;
    }

    public String getCustRemark() {
        return custRemark;
    }

    public void setCustRemark(String custRemark) {
        this.custRemark = custRemark;
    }

    public Integer getCustSatrt() {
        return custSatrt;
    }

    public void setCustSatrt(Integer custSatrt) {
        this.custSatrt = custSatrt;
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
}