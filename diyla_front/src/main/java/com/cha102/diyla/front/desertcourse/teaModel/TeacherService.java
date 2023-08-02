package com.cha102.diyla.front.desertcourse.teaModel;
import com.cha102.diyla.sweetclass.teaModel.SpecialityDAO;
import com.cha102.diyla.sweetclass.teaModel.SpecialityVO;
import com.cha102.diyla.sweetclass.teaModel.TeacherDAO;
import com.cha102.diyla.sweetclass.teaModel.TeacherVO;

import java.util.*;

public class TeacherService {
    private SpecialityDAO speDAO;
    private TeaSpecialityDAO teaSpeDAO;
    private TeacherDAO teaDAO;

    public com.cha102.diyla.sweetclass.teaModel.TeacherVO addTeacher(Integer empID, String teaName, Integer teaGender, String teaPhone,
                                                                     String teaIntro, byte[] teaPic, String teaEmail, int teaStatus){
        com.cha102.diyla.sweetclass.teaModel.TeacherVO teacherVO = new com.cha102.diyla.sweetclass.teaModel.TeacherVO();
        teacherVO.setEmpId(empID);
        teacherVO.setTeaName(teaName);
        teacherVO.setTeaGender(teaGender);
        teacherVO.setTeaPhone(teaPhone);
        teacherVO.setTeaIntro(teaIntro);
        teacherVO.setTeaPic(teaPic);
        teacherVO.setTeaEmail(teaEmail);
        teacherVO.setTeaStatus(teaStatus);
        teaDAO.insert(teacherVO);

        return teacherVO;
    }
    public com.cha102.diyla.sweetclass.teaModel.TeacherVO updateTeacher(Integer empID, String teaName, Integer teaGender, String teaPhone,
                                                                        String teaIntro, byte[] teaPic, String teaEmail, int teaStatus){
        com.cha102.diyla.sweetclass.teaModel.TeacherVO teacherVO = new com.cha102.diyla.sweetclass.teaModel.TeacherVO();
        teacherVO.setEmpId(empID);
        teacherVO.setTeaName(teaName);
        teacherVO.setTeaGender(teaGender);
        teacherVO.setTeaPhone(teaPhone);
        teacherVO.setTeaIntro(teaIntro);
        teacherVO.setTeaPic(teaPic);
        teacherVO.setTeaEmail(teaEmail);
        teacherVO.setTeaStatus(teaStatus);
        teaDAO.update(teacherVO);

        return teacherVO;
    }
    public void delTeacher(Integer teaID){
        teaDAO.delete(teaID);
    }
    public com.cha102.diyla.sweetclass.teaModel.TeacherVO getOneTeacher(Integer teaID) {
        return teaDAO.findByPrimaryKey(teaID);
    }
    public List<TeacherVO> getAllTeacher(){
        return teaDAO.getAll();
    }
    public com.cha102.diyla.sweetclass.teaModel.SpecialityVO addSpeciality(String speName){
        com.cha102.diyla.sweetclass.teaModel.SpecialityVO specialityVO = new com.cha102.diyla.sweetclass.teaModel.SpecialityVO();
        specialityVO.setSpeName(speName);
        speDAO.insert(specialityVO);
        return specialityVO;
    }
    public com.cha102.diyla.sweetclass.teaModel.SpecialityVO updateSpeciality(String speName){
        com.cha102.diyla.sweetclass.teaModel.SpecialityVO specialityVO = new com.cha102.diyla.sweetclass.teaModel.SpecialityVO();
        specialityVO.setSpeName(speName);
        speDAO.update(specialityVO);
        return specialityVO;
    }
    public void delSpeciality(Integer speID) {
        speDAO.delete(speID);
    }
    public com.cha102.diyla.sweetclass.teaModel.SpecialityVO getOneSpeciality(Integer speID) {
        return speDAO.findByPrimaryKey(speID);
    }
    public List<SpecialityVO> getAllSpeciality(){
        return speDAO.getAll();
    }
    public TeaSpecialityVO addTeaSpeciality(Integer teaID, Integer speID){
        TeaSpecialityVO teaSpecialityVO = new TeaSpecialityVO();
        teaSpecialityVO.setTeaId(teaID);
        teaSpecialityVO.setSpeId(speID);
        teaSpeDAO.insert(teaSpecialityVO);
        return teaSpecialityVO;
    }
    public TeaSpecialityVO updateTeaSpeciality(Integer teaID, Integer speID){
        TeaSpecialityVO teaSpecialityVO = new TeaSpecialityVO();
        teaSpecialityVO.setTeaId(teaID);
        teaSpecialityVO.setSpeId(speID);
        teaSpeDAO.update(teaSpecialityVO);
        return teaSpecialityVO;
    }
    public void delTeaSpeciality(Integer teaID, Integer speID) {
        teaSpeDAO.delete(teaID,speID);
    }
    public TeaSpecialityVO getOneTeaSpeciality(Integer teaID){
        return teaSpeDAO.findByPrimaryKey(teaID);
    }
    public List<TeaSpecialityVO> getAllTeaSpeciality(){
        return teaSpeDAO.getAll();
    }
}
