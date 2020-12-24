package com.powernode.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * t_employee
 * @author 
 */
public class Employee implements Serializable {
    private Integer employeeId;

    private Integer deptId;

    private Dept dept;

    //创建者
    private Employee creator;

    //修改者
    private Employee updator;

    /**
     * 员工工号，用户名
     */
    private String employeeNo;

    /**
     * 密码
     */
    private String employeePwd;

    /**
     * 员工姓名
     */
    private String employeeName;

    /**
     * 员工性别
     */
    private String employeeSex;

    /**
     * 员工年龄
     */
    private Integer employeeAge;

    /**
     * 员工手机号
     */
    private String employeePhone;

    /**
     * 身份证号
     */
    private String employeeCardNo;

    /**
     * 邮箱
     */
    private String employeeMail;

    /**
     * 生日
     */
    private Date employeeBirthday;

    /**
     * 职位
     */
    private String employeeJob;

    /**
     * 家庭住址
     */
    private String employeeAdress;


    /**
     * 失效日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+08:00")
    private Date employeeExpireTime;
    private String startTime;
    private String endTime;

    /**
     * 锁定状态(0 离职，1 在职)
     */
    private Integer employeeStatus;


    /**
     * ip地址
     */
    private String employeeAllowedIps;

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

    /**
     * 状态(0 离职，1 在职)
     */
    private String employeeStatusStr;

    /**
     * 提示信息
     */
    private String msg;

    private static final long serialVersionUID = 1L;

    public String getEmployeeStatusStr() {
        return employeeStatus==1?"<span style='color: green'>启用</span>":"<span style='color: red'>禁用</span>";
    }

    public void setEmployeeStatusStr(String employeeStatusStr) {
        this.employeeStatusStr = employeeStatusStr;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
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

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getEmployeeNo() {
        return employeeNo;
    }

    public void setEmployeeNo(String employeeNo) {
        this.employeeNo = employeeNo;
    }

    public String getEmployeePwd() {
        return employeePwd;
    }

    public void setEmployeePwd(String employeePwd) {
        this.employeePwd = employeePwd;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeSex() {
        return employeeSex;
    }

    public void setEmployeeSex(String employeeSex) {
        this.employeeSex = employeeSex;
    }

    public Integer getEmployeeAge() {
        return employeeAge;
    }

    public void setEmployeeAge(Integer employeeAge) {
        this.employeeAge = employeeAge;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeCardNo() {
        return employeeCardNo;
    }

    public void setEmployeeCardNo(String employeeCardNo) {
        this.employeeCardNo = employeeCardNo;
    }

    public String getEmployeeMail() {
        return employeeMail;
    }

    public void setEmployeeMail(String employeeMail) {
        this.employeeMail = employeeMail;
    }

    public Date getEmployeeBirthday() {
        return employeeBirthday;
    }

    public void setEmployeeBirthday(Date employeeBirthday) {
        this.employeeBirthday = employeeBirthday;
    }

    public String getEmployeeJob() {
        return employeeJob;
    }

    public void setEmployeeJob(String employeeJob) {
        this.employeeJob = employeeJob;
    }

    public String getEmployeeAdress() {
        return employeeAdress;
    }

    public void setEmployeeAdress(String employeeAdress) {
        this.employeeAdress = employeeAdress;
    }

    public Date getEmployeeExpireTime() {
        return employeeExpireTime;
    }

    public void setEmployeeExpireTime(Date employeeExpireTime) {
        this.employeeExpireTime = employeeExpireTime;
    }

    public Integer getEmployeeStatus() {
        return employeeStatus;
    }

    public void setEmployeeStatus(Integer employeeStatus) {
        this.employeeStatus = employeeStatus;
    }

    public String getEmployeeAllowedIps() {
        return employeeAllowedIps;
    }

    public void setEmployeeAllowedIps(String employeeAllowedIps) {
        this.employeeAllowedIps = employeeAllowedIps;
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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}