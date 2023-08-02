package com.cha102.diyla.front.desertcourse.teaModel;


import com.cha102.diyla.sweetclass.teaModel.SpecialityVO;

import java.util.List;

public interface SpecialityDAO {
    void insert(com.cha102.diyla.sweetclass.teaModel.SpecialityVO specialityVO);

    void update(com.cha102.diyla.sweetclass.teaModel.SpecialityVO specialityVO);

    void delete(Integer speID);

    com.cha102.diyla.sweetclass.teaModel.SpecialityVO findByPrimaryKey(Integer speID);

    List<SpecialityVO> getAll();
}
