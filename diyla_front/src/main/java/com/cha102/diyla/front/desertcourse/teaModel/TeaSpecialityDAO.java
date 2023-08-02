package com.cha102.diyla.front.desertcourse.teaModel;

import com.cha102.diyla.sweetclass.teaModel.TeaSpecialityVO;

import java.util.List;

public interface TeaSpecialityDAO {
    void insert(com.cha102.diyla.sweetclass.teaModel.TeaSpecialityVO teaSpecialityVO);

    void update(com.cha102.diyla.sweetclass.teaModel.TeaSpecialityVO teaSpecialityVO);

    void delete(Integer teaID,Integer speID);

    com.cha102.diyla.sweetclass.teaModel.TeaSpecialityVO findByPrimaryKey(Integer teaID);

    List<TeaSpecialityVO> getAll();
}
