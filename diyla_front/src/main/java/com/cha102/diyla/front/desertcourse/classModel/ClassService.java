package com.cha102.diyla.front.desertcourse.classModel;
import com.cha102.diyla.sweetclass.classModel.ClassDAO;
import com.cha102.diyla.sweetclass.classModel.ClassINGDAO;
import com.cha102.diyla.sweetclass.classModel.ClassINGVO;
import com.cha102.diyla.sweetclass.classModel.ClassVO;

import java.util.*;
import java.sql.*;
import java.sql.Date;

public class ClassService {
    private ClassDAO claDAO;
    private ClassReserveDAO resDAO;
    private ClassINGDAO ingDAO;

    public com.cha102.diyla.sweetclass.classModel.ClassVO addClass(Integer category, Integer teaID, Date regEndTime, Date classDate, Integer classSEQ,
                                                                   byte[] classPic, Integer limit, Integer price, String intro, String className,
                                                                   Integer headcount, Integer classStatus) {
        com.cha102.diyla.sweetclass.classModel.ClassVO classVO = new com.cha102.diyla.sweetclass.classModel.ClassVO();
        classVO.setCategory(category);
        classVO.setTeaId(teaID);
        classVO.setRegEndTime(regEndTime);
        classVO.setClassDate(classDate);
        classVO.setClassSeq(classSEQ);
        classVO.setClassPic(classPic);
        classVO.setLimit(limit);
        classVO.setPrice(price);
        classVO.setIntro(intro);
        classVO.setClassName(className);
        classVO.setHeadcount(headcount);
        classVO.setClassStatus(classStatus);
        claDAO.insert(classVO);

        return classVO;
    }
    public com.cha102.diyla.sweetclass.classModel.ClassVO updateClass(Integer category, Integer teaID, Date regEndTime, Date classDate, Integer classSEQ,
                                                                      byte[] classPic, Integer limit, Integer price, String intro, String className,
                                                                      Integer headcount, Integer classStatus){

        com.cha102.diyla.sweetclass.classModel.ClassVO classVO = new com.cha102.diyla.sweetclass.classModel.ClassVO();
        classVO.setCategory(category);
        classVO.setTeaId(teaID);
        classVO.setRegEndTime(regEndTime);
        classVO.setClassDate(classDate);
        classVO.setClassSeq(classSEQ);
        classVO.setClassPic(classPic);
        classVO.setLimit(limit);
        classVO.setPrice(price);
        classVO.setIntro(intro);
        classVO.setClassName(className);
        classVO.setHeadcount(headcount);
        classVO.setClassStatus(classStatus);
        claDAO.update(classVO);
        return classVO;
    }
    public void deleteClass(Integer claID) {
        claDAO.delete(claID);
    }
    public com.cha102.diyla.sweetclass.classModel.ClassVO getOneClass(Integer claID) {
        return claDAO.findByPrimaryKey(claID);
    }
    public com.cha102.diyla.sweetclass.classModel.ClassVO getByDate(Date classDate) {
        return claDAO.findByDate(classDate);
    }
    public List<ClassVO> getAllClass(){
        return claDAO.getAll();
    }
    public ClassReserveVO addReserve(Integer classID, Integer memID, Integer headcount, Integer status, Timestamp createTime, Integer totalPrice){
        ClassReserveVO classReserveVO = new ClassReserveVO();
        classReserveVO.setClassId(classID);
        classReserveVO.setMemId(memID);
        classReserveVO.setHeadcount(headcount);
        classReserveVO.setStatus(status);
        classReserveVO.setCreateTime(createTime);
        classReserveVO.setTotalPrice(totalPrice);
        resDAO.insert(classReserveVO);
        return classReserveVO;
    }
    public ClassReserveVO updateReserve(Integer classID, Integer memID, Integer headcount, Integer status, Timestamp createTime, Integer totalPrice){
        ClassReserveVO classReserveVO = new ClassReserveVO();
        classReserveVO.setClassId(classID);
        classReserveVO.setMemId(memID);
        classReserveVO.setHeadcount(headcount);
        classReserveVO.setStatus(status);
        classReserveVO.setCreateTime(createTime);
        classReserveVO.setTotalPrice(totalPrice);
        resDAO.update(classReserveVO);
        return classReserveVO;
    }
    public void delReserve(Integer resID){
        resDAO.delete(resID);
    }
    public ClassReserveVO getOneReserve(Integer resID) {
        return resDAO.findByPrimaryKey(resID);
    }
    public List<ClassReserveVO> getAllReserve(){
        return resDAO.getAll();
    }
    public com.cha102.diyla.sweetclass.classModel.ClassINGVO addClassING(Integer classID, Integer ingId, Integer ingNums){
        com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO =new com.cha102.diyla.sweetclass.classModel.ClassINGVO();
        classINGVO.setClassId(classID);
        classINGVO.setIngId(ingId);
        classINGVO.setIngNums(ingNums);
        ingDAO.insert(classINGVO);
        return classINGVO;
    }
    public com.cha102.diyla.sweetclass.classModel.ClassINGVO updateClassING(Integer classID, Integer ingId, Integer ingNums){
        com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO =new com.cha102.diyla.sweetclass.classModel.ClassINGVO();
        classINGVO.setClassId(classID);
        classINGVO.setIngId(ingId);
        classINGVO.setIngNums(ingNums);
        ingDAO.update(classINGVO);
        return classINGVO;
    }
    public void deleteClassIng(Integer classID, Integer ingID){
        ingDAO.delete(classID,ingID);
    }
    public com.cha102.diyla.sweetclass.classModel.ClassINGVO getOneClassIng(Integer classID, Integer ingID){
        return ingDAO.findByPrimaryKey(classID,ingID);
    }
    public List<ClassINGVO> findAllClassIng(){
        return ingDAO.getAll();
    }
}
