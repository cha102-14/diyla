package com.cha102.diyla.front.desertcourse.ingModel;

import com.cha102.diyla.sweetclass.ingModel.IngStorageVO;

import java.util.List;

public interface IngStorageDAO {
    void insert(com.cha102.diyla.sweetclass.ingModel.IngStorageVO ingStorageVO);

    void update(com.cha102.diyla.sweetclass.ingModel.IngStorageVO ingStorageVO);

    void delete(Integer ingID);

    com.cha102.diyla.sweetclass.ingModel.IngStorageVO findByPrimaryKey(Integer ingID);

    List<IngStorageVO> getAll();
}
