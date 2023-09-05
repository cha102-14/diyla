package com.cha102.diyla.empmodel;

import com.alibaba.fastjson.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface EmpJPADAO extends JpaRepository<EmpVO, Long> {

//    計算篩選條件下的總筆數
    @Query(nativeQuery = true,
            value = "SELECT COUNT(DISTINCT(e.EMP_ID)) FROM diyla.employee e " +
                    "JOIN diyla.backstage_auth a ON e.emp_id = a.EMP_ID " +
                    "JOIN diyla.backstage_fun f ON a.AUTH_ID = f.AUTH_ID " +
                    "WHERE if(?1 !='',f.TYPE_FUN = ?1, 1=1) and e.emp_id != 1 ORDER BY e.emp_ID")
    Integer getAllEmpCount(String chooseTypeFun);

    @Query(nativeQuery = true,
            value = "SELECT DISTINCT(e.EMP_ID),e.EMP_NAME,e.EMP_PIC,e.EMP_EMAIL,f.TYPE_FUN,e.EMP_STATUS FROM diyla.employee e " +
                    "JOIN diyla.backstage_auth a ON e.emp_id = a.EMP_ID " +
                    "JOIN diyla.backstage_fun f ON a.AUTH_ID = f.AUTH_ID " +
                    "WHERE if(?3 !='',f.TYPE_FUN = ?3, 1=1) and e.emp_id != 1 ORDER BY e.emp_ID LIMIT ?1, ?2")
//    Query查詢回來的物件 如只有 1筆 可用JSONObject[]及Object[]接值,如 n 筆以上資料 只能用Object[]接值
    List<Object[]> getAllEmp(Integer pageIndex, Integer pageSize ,String chooseTypeFun);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,
           value = "UPDATE diyla.employee SET EMP_STATUS = :empStatus WHERE EMP_ID = :empId")
//    int為返回修改筆數共幾筆
    int changeEmpStatus(@Param("empId") Integer empId, @Param("empStatus")Integer empStatus);



    @Query(nativeQuery = true,
            value = "SELECT DISTINCT f.TYPE_FUN, a.EMP_ID FROM diyla.backstage_auth a join diyla.backstage_fun f on a.AUTH_ID = f.AUTH_ID WHERE a.EMP_ID = (SELECT EMP_ID FROM diyla.employee WHERE EMP_ACCOUNT = ?1 AND EMP_PASSWORD = ?2)")
    List<Object[]> validEmpLogin(String empAccount, String empPassword);

    @Query(nativeQuery = true,value = "SELECT COUNT(1) FROM employee WHERE EMP_EMAIL = ?1")
    Integer checkEmail(String empEmail);

    @Transactional
    @Modifying
    @Query(nativeQuery = true,
           value = "UPDATE employee set EMP_PASSWORD=?2 WHERE EMP_EMAIL=?1")
    Integer resertPassword(String userEmail,String newPassword);



}
