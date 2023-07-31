package com.cha102.diyla.sweetclass.ingModel;

import com.cha102.diyla.sweetclass.ingModel.IngStorageVO;

import java.util.List;

public interface IngStorageDAO_interface {
    void insert(IngStorageVO ingStorageVO);

    void update(IngStorageVO ingStorageVO);

    void delete(Integer ingID);

    IngStorageVO findByPrimaryKey(Integer ingID);

    List<IngStorageVO> getAll();
}
