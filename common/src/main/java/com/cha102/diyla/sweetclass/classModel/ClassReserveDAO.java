package com.cha102.diyla.sweetclass.classModel;

import java.util.List;

public interface ClassReserveDAO {
    void insert(ClassReserveVO classReserveVO);

    void update(ClassReserveVO classReserveVO);

    void delete(Integer resID);

    ClassReserveVO findByPrimaryKey(Integer resID);

    List<ClassReserveVO> getAll();
}
