package com.cha102.diyla.front.desertcourse.ingModel;
import com.cha102.diyla.sweetclass.ingModel.IngStorageDAO;
import com.cha102.diyla.sweetclass.ingModel.IngStorageVO;

import java.util.*;
public class IngStorageService {
    private IngStorageDAO ingStorageDAO;

    public com.cha102.diyla.sweetclass.ingModel.IngStorageVO addIngStorage (String brand, String ingName, Integer ingNums, Integer status, Integer servingSize) {
        com.cha102.diyla.sweetclass.ingModel.IngStorageVO ingStorageVO = new com.cha102.diyla.sweetclass.ingModel.IngStorageVO();
        ingStorageVO.setBrand(brand);
        ingStorageVO.setIngName(ingName);
        ingStorageVO.setIngNums(ingNums);
        ingStorageVO.setStatus(status);
        ingStorageVO.setServingSize(servingSize);
        ingStorageDAO.insert(ingStorageVO);
        return ingStorageVO;
    }
    public com.cha102.diyla.sweetclass.ingModel.IngStorageVO updateIngStorage(String brand, String ingName, Integer ingNums, Integer status, Integer servingSize) {
        com.cha102.diyla.sweetclass.ingModel.IngStorageVO ingStorageVO = new com.cha102.diyla.sweetclass.ingModel.IngStorageVO();
        ingStorageVO.setBrand(brand);
        ingStorageVO.setIngName(ingName);
        ingStorageVO.setIngNums(ingNums);
        ingStorageVO.setStatus(status);
        ingStorageVO.setServingSize(servingSize);
        ingStorageDAO.update(ingStorageVO);
        return ingStorageVO;
    }
    public void deleteIngStorage(Integer ingID){
        ingStorageDAO.delete(ingID);
    }
    public com.cha102.diyla.sweetclass.ingModel.IngStorageVO getOneIngStorage(Integer ingID) {
        return ingStorageDAO.findByPrimaryKey(ingID);
    }
    public List<IngStorageVO> getAll(){
        return ingStorageDAO.getAll();
    }
}
