package com.cha102.diyla.empmodel;

import com.cha102.diyla.backstageauthmodel.BackStageAuthVO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public interface EmpDAO {

    public Integer insertEmp(EmpVO empVO, Connection con);

    public  void insertBackStageAuthVO( List<BackStageAuthVO> backStageAuthVOList,Connection con);

    public  void updateEmp(EmpVO empVO);

    public void deleteEmp(Integer empId);

    public String checkFinalAccountNumber();

    public Boolean checkEmpEmailForRegister(String empEmail);

    public EmpVO getOne(Integer empId);

    public List<EmpVO> getAll();

    public Connection getConnectionForTx() throws SQLException;
}
