package com.cha102.diyla.sweetclass.teaModel;
import java.util.*;

public class TeacherService {
    private SpecialityDAO speDAO;
    private TeaSpecialityDAO teaSpeDAO;
    private TeacherDAO teaDAO;

    public TeacherService() {
        teaDAO = new TeacherDAOImpl();
        speDAO = new SpecialityDAOImpl();
        teaSpeDAO = new TeaSpecialityDAOImpl();
    }

    public int addTeacher(Integer empID, String teaName, Integer teaGender, String teaPhone,
                                String teaIntro, byte[] teaPic, String teaEmail, int teaStatus){
        TeacherVO teacherVO = new TeacherVO();
        teacherVO.setEmpId(empID);
        teacherVO.setTeaName(teaName);
        teacherVO.setTeaGender(teaGender);
        teacherVO.setTeaPhone(teaPhone);
        teacherVO.setTeaIntro(teaIntro);
        teacherVO.setTeaPic(teaPic);
        teacherVO.setTeaEmail(teaEmail);
        teacherVO.setTeaStatus(teaStatus);
        int pk = teaDAO.insert(teacherVO);

        return pk;
    }
    public TeacherVO updateTeacher(Integer empID, String teaName, Integer teaGender, String teaPhone,
                                   String teaIntro, byte[] teaPic, String teaEmail, int teaStatus){
        TeacherVO teacherVO = new TeacherVO();
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
    public TeacherVO getOneTeacher(Integer teaID) {

        return teaDAO.findByPrimaryKey(teaID);
    }
    public List<TeacherVO> getAllTeacher(){

        return teaDAO.getAll();
    }
    public SpecialityVO addSpeciality(String speName){
        SpecialityVO specialityVO = new SpecialityVO();
        specialityVO.setSpeName(speName);
        speDAO.insert(specialityVO);
        return specialityVO;
    }
    public SpecialityVO updateSpeciality(String speName){
        SpecialityVO specialityVO = new SpecialityVO();
        specialityVO.setSpeName(speName);
        speDAO.update(specialityVO);
        return specialityVO;
    }
    public void delSpeciality(Integer speID) {
        speDAO.delete(speID);
    }
    public SpecialityVO getOneSpeciality(Integer speID) {
        return speDAO.findByPrimaryKey(speID);
    }
    public Integer getOneSpecialityID(String speName) {
        return speDAO.findBySpeName(speName);
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
