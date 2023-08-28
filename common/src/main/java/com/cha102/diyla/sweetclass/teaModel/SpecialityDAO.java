package com.cha102.diyla.sweetclass.teaModel;


import java.util.List;

public interface SpecialityDAO {
    void insert(SpecialityVO specialityVO);

    void update(SpecialityVO specialityVO);

    void delete(Integer speID);

    String findBySpeId(Integer speID);

    Integer findBySpeName(String speName);

    List<SpecialityVO> getAll();
}
