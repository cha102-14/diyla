package com.cha102.diyla.front.desertcourse.classModel;

import com.cha102.diyla.sweetclass.classModel.ClassReserveVO;

import java.util.List;

public interface ClassReserveDAO {
    void insert(com.cha102.diyla.sweetclass.classModel.ClassReserveVO classReserveVO);

    void update(com.cha102.diyla.sweetclass.classModel.ClassReserveVO classReserveVO);

    void delete(Integer resID);

    com.cha102.diyla.sweetclass.classModel.ClassReserveVO findByPrimaryKey(Integer resID);

    List<ClassReserveVO> getAll();
}
