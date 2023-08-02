package com.cha102.diyla.diyOrder;

import java.util.List;

public interface DiyOrderDAO_interface {
    public void insert(DiyOrderVO diyOrderVO);
    public void update(DiyOrderVO diyOrderVO);
    public void delete(Integer diyOrderNo);
    public DiyOrderVO findByPrimaryKey(Integer diyOrderNo);
    public List<DiyOrderVO> getAll();
}