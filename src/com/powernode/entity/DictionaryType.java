package com.powernode.entity;

import java.io.Serializable;

/**
 * t_dictionary_type
 * @author 
 */
public class DictionaryType implements Serializable {
    private Integer dictTypeId;

    private String dictTypeName;

    private String dictTypeCode;

    /**
     * 是否可用(0 禁用，1 启用)
     */
    private Integer dictTypeStatus;

    private String msg;

    private static final long serialVersionUID = 1L;

    public Integer getDictTypeId() {
        return dictTypeId;
    }

    public void setDictTypeId(Integer dictTypeId) {
        this.dictTypeId = dictTypeId;
    }

    public String getDictTypeName() {
        return dictTypeName;
    }

    public void setDictTypeName(String dictTypeName) {
        this.dictTypeName = dictTypeName;
    }

    public String getDictTypeCode() {
        return dictTypeCode;
    }

    public void setDictTypeCode(String dictTypeCode) {
        this.dictTypeCode = dictTypeCode;
    }

    public Integer getDictTypeStatus() {
        return dictTypeStatus;
    }

    public void setDictTypeStatus(Integer dictTypeStatus) {
        this.dictTypeStatus = dictTypeStatus;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}