package com.cha102.diyla.front.desertcourse.teaModel;

import com.cha102.diyla.sweetclass.teaModel.TeacherVO;

import java.util.List;

public interface TeacherDAO {
    void insert(com.cha102.diyla.sweetclass.teaModel.TeacherVO teacherVO);

    void update(com.cha102.diyla.sweetclass.teaModel.TeacherVO teacherVO);

    void delete(Integer teaID);

    com.cha102.diyla.sweetclass.teaModel.TeacherVO findByPrimaryKey(Integer teaID);

    List<TeacherVO> getAll();
}
