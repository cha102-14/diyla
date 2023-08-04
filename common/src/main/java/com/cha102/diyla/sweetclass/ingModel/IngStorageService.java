package com.cha102.diyla.sweetclass.ingModel;
import java.util.*;
public class IngStorageService {
    private IngStorageDAO ingStorageDAO;
    public IngStorageService(){
        ingStorageDAO = new IngStorageDAOImpl();
    }

    public IngStorageVO addIngStorage (String brand, String ingName, Integer ingNums, Integer status, Integer servingSize) {
        IngStorageVO ingStorageVO = new IngStorageVO();
        ingStorageVO.setBrand(brand);
        ingStorageVO.setIngName(ingName);
        ingStorageVO.setIngNums(ingNums);
        ingStorageVO.setStatus(status);
        ingStorageVO.setServingSize(servingSize);
        ingStorageDAO.insert(ingStorageVO);
        return ingStorageVO;
    }
    public IngStorageVO updateIngStorage(String brand, String ingName, Integer ingNums, Integer status, Integer servingSize) {
        IngStorageVO ingStorageVO = new IngStorageVO();
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
    public IngStorageVO getOneIngStorage(Integer ingID) {
        return ingStorageDAO.findByPrimaryKey(ingID);
    }
    public List<IngStorageVO> getAll(){
        return ingStorageDAO.getAll();
    }
}
