package com.cha102.diyla.front.desertcourse.classModel;
import com.cha102.diyla.sweetclass.classModel.ClassVO;

import java.util.*;
public interface ClassDAO {

    void insert(com.cha102.diyla.sweetclass.classModel.ClassVO classVO);

    void update(com.cha102.diyla.sweetclass.classModel.ClassVO classVO);

    void delete(Integer claid);

    com.cha102.diyla.sweetclass.classModel.ClassVO findByPrimaryKey(Integer claid);

    com.cha102.diyla.sweetclass.classModel.ClassVO findByDate(java.sql.Date classDate);

    List<ClassVO> getAll();

}
