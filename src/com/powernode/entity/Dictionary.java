package com.powernode.entity;

import java.io.Serializable;

/**
 * t_dictionary
 * @author 
 */
public class Dictionary implements Serializable {
    private Integer dictId;

    private Integer dictTypeId;

    /**
     * 字典的值
     */
    private String dictValue;

    /**
     * 字典的次序
     */
    private Integer dictOrder;

    /**
     * 是否可用
     */
    private Integer dictStatus;

    private DictionaryType dictionaryType;

    private static final long serialVersionUID = 1L;

    public Integer getDictId() {
        return dictId;
    }

    public void setDictId(Integer dictId) {
        this.dictId = dictId;
    }

    public Integer getDictTypeId() {
        return dictTypeId;
    }

    public void setDictTypeId(Integer dictTypeId) {
        this.dictTypeId = dictTypeId;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }

    public Integer getDictOrder() {
        return dictOrder;
    }

    public void setDictOrder(Integer dictOrder) {
        this.dictOrder = dictOrder;
    }

    public Integer getDictStatus() {
        return dictStatus;
    }

    public void setDictStatus(Integer dictStatus) {
        this.dictStatus = dictStatus;
    }

    public DictionaryType getDictionaryType() {
        return dictionaryType;
    }

    public void setDictionaryType(DictionaryType dictionaryType) {
        this.dictionaryType = dictionaryType;
    }
}