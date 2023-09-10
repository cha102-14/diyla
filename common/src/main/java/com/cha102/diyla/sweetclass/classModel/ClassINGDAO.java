package com.cha102.diyla.sweetclass.classModel;

import java.util.List;

public interface ClassINGDAO {
    void insert(ClassINGVO classINGVO);

    void update(ClassINGVO classINGVO);

    void delete(Integer claID, Integer ingID);
    void deleteOneCourseIng(Integer claID);

    ClassINGVO findByPrimaryKey(Integer claID, Integer ingID);

    List<ClassINGVO> getAll();
    List<ClassINGVO> findIngIdAmountByClaId(Integer claID);
}
