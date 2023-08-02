package com.cha102.diyla.front.desertcourse.classModel;

import com.cha102.diyla.sweetclass.classModel.ClassINGVO;

import java.util.List;

public interface ClassINGDAO {
    void insert(com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO);

    void update(com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO);

    void delete(Integer claID, Integer ingID);

    com.cha102.diyla.sweetclass.classModel.ClassINGVO findByPrimaryKey(Integer claID, Integer ingID);

    List<ClassINGVO> getAll();

}
