package com.cha102.diyla.diyIng;

import java.io.Serializable;

public class DIYIngredientVO implements Serializable {
    private Integer diyNo;
    private Integer ingId;
    private Integer ingCount;

   
    public DIYIngredientVO() {
    }

    public DIYIngredientVO(Integer diyNo, Integer ingId, Integer ingCount) {
        this.diyNo = diyNo;
        this.ingId = ingId;
        this.ingCount = ingCount;
    }

    
    public Integer getDiyNo() {
        return diyNo;
    }

    public void setDiyNo(Integer diyNo) {
        this.diyNo = diyNo;
    }

    public Integer getIngId() {
        return ingId;
    }

    public void setIngId(Integer ingId) {
        this.ingId = ingId;
    }

    public Integer getIngCount() {
        return ingCount;
    }

    public void setIngCount(Integer ingCount) {
        this.ingCount = ingCount;
    }

    @Override
    public String toString() {
        return "DIYIngredientVO{" +
                "diyNo=" + diyNo +
                ", ingId=" + ingId +
                ", ingCount=" + ingCount +
                '}';
    }
}
