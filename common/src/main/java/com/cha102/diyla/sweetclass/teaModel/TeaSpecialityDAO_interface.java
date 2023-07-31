package com.cha102.diyla.sweetclass.teaModel;

import java.util.List;

public interface TeaSpecialityDAO_interface {
    void insert(TeaSpecialityVO teaSpecialityVO);

    void update(TeaSpecialityVO teaSpecialityVO);

    void delete(Integer teaID,Integer speID);

    TeaSpecialityVO findByPrimaryKey(Integer teaID, Integer speID);

    List<TeaSpecialityVO> getAll();
}
