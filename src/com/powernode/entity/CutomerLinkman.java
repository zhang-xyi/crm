package com.powernode.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * t_cutomer_linkman
 * @author 
 */
public class CutomerLinkman implements Serializable {
    /**
     * 联系人id
     */
    private Integer linkmanId;

    private Integer custId;
    private Customer customer;

    /**
     * 姓名
     */
    private String linkmanName;

    /**
     * 职务
     */
    private String linkmanJob;

    /**
     * 年龄
     */
    private Integer linkmanAge;

    /**
     * 称呼
     */
    private String linkmanAppellation;

    /**
     * 性别 0 男 , 1女
     */
    private Integer linkmanSex;

    /**
     * 部门
     */
    private String linkmanDept;

    /**
     * 移动电话
     */
    private String linkmanMobelPhone;

    /**
     * 座机
     */
    private String linkmanPhone;

    /**
     * 邮箱
     */
    private String linkmanMail;

    /**
     * 地址
     */
    private String linkmanAdress;

    /**
     * 生日
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date linkmanBirthday;

    /**
     * 下次联系时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date linkmanNextDate;

    /**
     * 备注
     */
    private String linkmanRemark;

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

    private Employee creator;

    private Employee updator;

    private static final long serialVersionUID = 1L;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Integer getLinkmanId() {
        return linkmanId;
    }

    public void setLinkmanId(Integer linkmanId) {
        this.linkmanId = linkmanId;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getLinkmanName() {
        return linkmanName;
    }

    public void setLinkmanName(String linkmanName) {
        this.linkmanName = linkmanName;
    }

    public String getLinkmanJob() {
        return linkmanJob;
    }

    public void setLinkmanJob(String linkmanJob) {
        this.linkmanJob = linkmanJob;
    }

    public Integer getLinkmanAge() {
        return linkmanAge;
    }

    public void setLinkmanAge(Integer linkmanAge) {
        this.linkmanAge = linkmanAge;
    }

    public String getLinkmanAppellation() {
        return linkmanAppellation;
    }

    public void setLinkmanAppellation(String linkmanAppellation) {
        this.linkmanAppellation = linkmanAppellation;
    }

    public Integer getLinkmanSex() {
        return linkmanSex;
    }

    public void setLinkmanSex(Integer linkmanSex) {
        this.linkmanSex = linkmanSex;
    }

    public String getLinkmanDept() {
        return linkmanDept;
    }

    public void setLinkmanDept(String linkmanDept) {
        this.linkmanDept = linkmanDept;
    }

    public String getLinkmanMobelPhone() {
        return linkmanMobelPhone;
    }

    public void setLinkmanMobelPhone(String linkmanMobelPhone) {
        this.linkmanMobelPhone = linkmanMobelPhone;
    }

    public String getLinkmanPhone() {
        return linkmanPhone;
    }

    public void setLinkmanPhone(String linkmanPhone) {
        this.linkmanPhone = linkmanPhone;
    }

    public String getLinkmanMail() {
        return linkmanMail;
    }

    public void setLinkmanMail(String linkmanMail) {
        this.linkmanMail = linkmanMail;
    }

    public String getLinkmanAdress() {
        return linkmanAdress;
    }

    public void setLinkmanAdress(String linkmanAdress) {
        this.linkmanAdress = linkmanAdress;
    }

    public Date getLinkmanBirthday() {
        return linkmanBirthday;
    }

    public void setLinkmanBirthday(Date linkmanBirthday) {
        this.linkmanBirthday = linkmanBirthday;
    }

    public Date getLinkmanNextDate() {
        return linkmanNextDate;
    }

    public void setLinkmanNextDate(Date linkmanNextDate) {
        this.linkmanNextDate = linkmanNextDate;
    }

    public String getLinkmanRemark() {
        return linkmanRemark;
    }

    public void setLinkmanRemark(String linkmanRemark) {
        this.linkmanRemark = linkmanRemark;
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