
package com.cha102.diyla.diycatemodel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class DiyOrderDTOService {

    @Autowired
    private DiyOrderRepository diyOrderRepository;
    public DiyOrderDTOService(){}

    public List<DiyOrderDTO> findById(Integer id){
        List<Object[]> r = diyOrderRepository.findAll(id);
        List<DiyOrderDTO> list = r.stream().map(DiyOrderDTO::new).collect(Collectors.toList());
        return list;
    }
}
