package com.cha102.diyla.sweetclass.classModel;
import java.util.*;
public interface ClassDAO_interface {

    void insert(ClassVO classVO);

    void update(ClassVO classVO);

    void delete(Integer claid);

    ClassVO findByPrimaryKey(Integer claid);

    List<ClassVO> getAll();

}
