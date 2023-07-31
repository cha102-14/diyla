package com.cha102.diyla.sweetclass.teaModel;


import java.util.List;

public interface SpecialityDAO_interface {
    void insert(SpecialityVO specialityVO);

    void update(SpecialityVO specialityVO);

    void delete(Integer speID);

    SpecialityVO findByPrimaryKey(Integer speID);

    List<SpecialityVO> getAll();
}
