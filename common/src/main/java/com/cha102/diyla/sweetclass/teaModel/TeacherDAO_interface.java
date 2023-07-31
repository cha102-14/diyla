package com.cha102.diyla.sweetclass.teaModel;

import java.util.List;

public interface TeacherDAO_interface {
    void insert(TeacherVO teacherVO);

    void update(TeacherVO teacherVO);

    void delete(Integer teaID);

    TeacherVO findByPrimaryKey(Integer teaID);

    List<TeacherVO> getAll();
}
