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
    public TeacherVO updateTeacher(Integer teaID, Integer empID, String teaName, Integer teaGender, String teaPhone,
                                   String teaIntro, byte[] teaPic, String teaEmail, int teaStatus){
        TeacherVO teacherVO = new TeacherVO();
        teacherVO.setTeaId(teaID);
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
    public TeacherVO getOneTeacherByEmpId (Integer empID) {
        return teaDAO.findTeaByEmpID(empID);
    }
    public boolean verifyTeacherId(Integer teaID) {
        Optional<TeacherVO> tea = Optional.ofNullable(teaDAO.findByPrimaryKey(teaID));
        if(tea.isPresent()) {
            return true;
        } else {
            return false;
        }
    }

    public List<TeacherVO> getAllTeacher(){

        return teaDAO.getAll();
    }
    public boolean updateTeaStatus(Integer teaId, Integer status){
        TeacherVO teacherVO = teaDAO.findByPrimaryKey(teaId);
        teacherVO.setTeaStatus(status);
        try {
            teaDAO.update(teacherVO);
            return true;
        } catch (RuntimeException re) {
            re.printStackTrace();
            return false;
        }
    }
    public SpecialityVO addSpeciality(String speName) throws RuntimeException{
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

    public Integer getOneSpecialityID(String speName) {
        return speDAO.findBySpeName(speName);
    }
    public String getTeacherSpecialityString(Integer teaID){
        TeacherDAO teacherDAO = new TeacherDAOImpl();
        List<String> teacherSpecialities = teacherDAO.getTeacherSpeciality(teaID);
        StringBuilder teacherSpeString = new StringBuilder();
        for (int i = 0; i < teacherSpecialities.size(); i++) {
            teacherSpeString.append(teacherSpecialities.get(i));
            if (i < teacherSpecialities.size() - 1) {
                teacherSpeString.append(", ");
            }
        }
        return teacherSpeString.toString();
    }
    public List<SpecialityVO> getAllSpeciality(){
        return speDAO.getAll();
    }
    public TeaSpecialityVO addTeaSpeciality(Integer teaID, Integer speID) throws RuntimeException{
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
    public void delTeaSpeciality(Integer teaID) {
        teaSpeDAO.delete(teaID);
    }
    public List<String> getOneTeaSpecialityStringList(Integer teaID){
        List<Integer> speIdArray = teaSpeDAO.findByTeaId(teaID);
        List<String> speNameArray = new ArrayList<String>();
        for(int i = 0; i < speIdArray.size(); i++) {
            speNameArray.add(speDAO.findBySpeId(speIdArray.get(i)));
        }
        return speNameArray;
    }
    public List<TeaSpecialityVO> getAllTeaSpeciality(){
        return teaSpeDAO.getAll();
    }
}
