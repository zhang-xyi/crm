package com.powernode.entity;

import java.io.Serializable;

/**
 * t_dept
 * @author 
 */

public class Dept implements Serializable {
    private Integer deptId;

    private String deptName;

    private String deptCode;

    /**
     * 部门状态(0 不可用,1 可用)
     */
    private Integer deptStatus;

    /**
     * 父部门的id
     */
    private Integer parentId;

    private static final long serialVersionUID = 1L;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public Integer getDeptStatus() {
        return deptStatus;
    }

    public void setDeptStatus(Integer deptStatus) {
        this.deptStatus = deptStatus;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}