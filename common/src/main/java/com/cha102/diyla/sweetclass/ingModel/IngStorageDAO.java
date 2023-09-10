package com.cha102.diyla.sweetclass.ingModel;

import java.util.List;

public interface IngStorageDAO {
    void insert(IngStorageVO ingStorageVO);

    void update(IngStorageVO ingStorageVO);

    void delete(Integer ingID);

    IngStorageVO findByPrimaryKey(Integer ingID);

    List<IngStorageVO> getAll();
}
