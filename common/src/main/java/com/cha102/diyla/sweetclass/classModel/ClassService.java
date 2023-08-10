package com.cha102.diyla.sweetclass.classModel;
import java.util.*;
import java.sql.*;
import java.sql.Date;

public class ClassService {
    private ClassDAO claDAO;
    private ClassReserveDAO resDAO;
    private ClassINGDAO ingDAO;
    public  ClassService(){
        claDAO = new ClassDAOImpl();
        resDAO = new ClassReserveDAOImpl();
        ingDAO = new ClassINGDAOImpl();
    }
    public ClassVO addClass(Integer category, Integer teaID, Date regEndTime, Date classDate, Integer classSEQ,
                            byte[] classPic, Integer classLimit, Integer price, String intro, String className,
                            Integer headcount, Integer classStatus) {
        ClassVO classVO = new ClassVO();
        classVO.setCategory(category);
        classVO.setTeaId(teaID);
        classVO.setRegEndTime(regEndTime);
        classVO.setClassDate(classDate);
        classVO.setClassSeq(classSEQ);
        classVO.setClassPic(classPic);
        classVO.setClassLimit(classLimit);
        classVO.setPrice(price);
        classVO.setIntro(intro);
        classVO.setClassName(className);
        classVO.setHeadcount(headcount);
        classVO.setClassStatus(classStatus);
        claDAO.insert(classVO);

        return classVO;
    }
    public ClassVO updateClass(Integer category, Integer teaID, Date regEndTime, Date classDate, Integer classSEQ,
                               byte[] classPic, Integer classLimit, Integer price, String intro, String className,
                               Integer headcount, Integer classStatus){

        ClassVO classVO = new ClassVO();
        classVO.setCategory(category);
        classVO.setTeaId(teaID);
        classVO.setRegEndTime(regEndTime);
        classVO.setClassDate(classDate);
        classVO.setClassSeq(classSEQ);
        classVO.setClassPic(classPic);
        classVO.setClassLimit(classLimit);
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
    public ClassVO getOneClass(Integer claID) {
        return claDAO.findByPrimaryKey(claID);
    }
    public ClassVO getByDate(Date classDate) {
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
    public ClassReserveVO updateReserve(Integer classID, Integer memID, Integer headcount, Integer status, Timestamp createTime, Integer totalPrice, Integer reserveID){
        ClassReserveVO classReserveVO = new ClassReserveVO();
        classReserveVO.setClassId(classID);
        classReserveVO.setMemId(memID);
        classReserveVO.setHeadcount(headcount);
        classReserveVO.setStatus(status);
        classReserveVO.setCreateTime(createTime);
        classReserveVO.setTotalPrice(totalPrice);
        classReserveVO.setReserveId(reserveID);
        resDAO.update(classReserveVO);
        return classReserveVO;
    }
    public void delReserve(Integer resID){
        resDAO.delete(resID);
    }
    public void updateReserveStatus(Integer resID, Integer status) {
        ClassReserveVO classReserveVO = resDAO.findByPrimaryKey(resID);
        classReserveVO.setStatus(status);
        resDAO.update(classReserveVO);
    }
    public ClassReserveVO getOneReserve(Integer resID) {
        return resDAO.findByPrimaryKey(resID);
    }
    public List<ClassReserveVO> getAllReserve(){
        return resDAO.getAll();
    }
    public ClassINGVO addClassING(Integer classID, Integer ingId, Integer ingNums){
        ClassINGVO classINGVO =new ClassINGVO();
        classINGVO.setClassId(classID);
        classINGVO.setIngId(ingId);
        classINGVO.setIngNums(ingNums);
        ingDAO.insert(classINGVO);
        return classINGVO;
    }
    public ClassINGVO updateClassING(Integer classID, Integer ingId, Integer ingNums){
        ClassINGVO classINGVO =new ClassINGVO();
        classINGVO.setClassId(classID);
        classINGVO.setIngId(ingId);
        classINGVO.setIngNums(ingNums);
        ingDAO.update(classINGVO);
        return classINGVO;
    }
    public void deleteClassIng(Integer classID, Integer ingID){
        ingDAO.delete(classID,ingID);
    }
    public ClassINGVO getOneClassIng(Integer classID, Integer ingID){
        return ingDAO.findByPrimaryKey(classID,ingID);
    }
    public List<ClassINGVO> findAllClassIng(){
        return ingDAO.getAll();
    }
}
