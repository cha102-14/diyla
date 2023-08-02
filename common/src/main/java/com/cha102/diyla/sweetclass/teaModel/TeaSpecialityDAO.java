package com.cha102.diyla.sweetclass.teaModel;

import java.util.List;

public interface TeaSpecialityDAO {
    void insert(TeaSpecialityVO teaSpecialityVO);

    void update(TeaSpecialityVO teaSpecialityVO);

    void delete(Integer teaID,Integer speID);

    TeaSpecialityVO findByPrimaryKey(Integer teaID);

    List<TeaSpecialityVO> getAll();
}
