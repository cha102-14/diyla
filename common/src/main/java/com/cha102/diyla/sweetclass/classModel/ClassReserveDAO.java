package com.cha102.diyla.sweetclass.classModel;

import java.util.List;

public interface ClassReserveDAO {
    void insert(ClassReserveVO classReserveVO);

    void update(ClassReserveVO classReserveVO);

    void delete(Integer resID);
    Integer findMemBlackListStatus(Integer memID);

    ClassReserveVO findByPrimaryKey(Integer resID);

    List<ClassReserveVO> getAll();
    String getMemName(Integer memID);
}
