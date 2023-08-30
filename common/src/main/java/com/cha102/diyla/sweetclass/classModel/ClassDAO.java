package com.cha102.diyla.sweetclass.classModel;

import java.util.List;
public interface ClassDAO {

    void insert(ClassVO classVO);

    void update(ClassVO classVO);

    void delete(Integer claid);

    ClassVO findByPrimaryKey(Integer claid);

    ClassVO findByDate(java.sql.Date classDate);

    List<ClassVO> getAll();

}
