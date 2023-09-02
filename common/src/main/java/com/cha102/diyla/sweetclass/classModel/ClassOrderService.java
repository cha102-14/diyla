package com.cha102.diyla.sweetclass.classModel;

import java.util.List;

public class ClassOrderService {

    private ClassOrderDAO classOrderDAO;

    public ClassOrderService(){classOrderDAO = new ClassOrderDAOImpl();}

    public List<ClassOrderDTO> getAllByMemId (Integer memId){

        return classOrderDAO.findById(memId);
    }
}
