package com.cha102.diyla.empmodel;

import java.util.List;

public interface EmpDAO {
    public void insert(EmpVO empVO);

    public  void update(EmpVO empVO);

    public void delete(Integer empId);

    public EmpVO getOne(Integer empId);

    public List<EmpVO> getAll();


}
