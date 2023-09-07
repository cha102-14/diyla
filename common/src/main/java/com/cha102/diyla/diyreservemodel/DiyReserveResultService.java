package com.cha102.diyla.diyreservemodel;

import org.springframework.stereotype.Service;

import com.cha102.diyla.diyOrder.DiyOrderDTO;
import com.cha102.diyla.diyOrder.DiyOrderService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DiyReserveResultService {
    @Resource
    private DiyReserveResultEntityRepository reserveResultRepository;

    // 根據日期範圍獲取項目數量
    public List<DIYReserveVO[]> getItemQuantityByDateRange(Date endDate) {
        return reserveResultRepository.getItemQuantityByDateRange(endDate);
    }
    // 執行預訂
    public DiyReserveResultEntity insert(DiyReserveResultEntity diyReserveResultEntity) {
        int selectedPeriod = diyReserveResultEntity.getDiyPeriod();
        int currentPeoCount = getCurrentPeoCount(selectedPeriod);

        if (currentPeoCount >= 10) {
            // 設定RESERVE_STATUS為1（不可預約）
            diyReserveResultEntity.setReserveStatus(1);
        } else {
            // 設定RESERVE_STATUS為0（可預約）
            diyReserveResultEntity.setReserveStatus(0);
        }

        // 設定PEO_LIMIT為剩餘可用位數
        diyReserveResultEntity.setPeoLimit(10 - currentPeoCount);

        // 根據需要設定其他欄位（DIY_RESERVE_DATE、RESERVE_UPD_TIME、ITEM_QUANTITY）

        // 儲存預訂
        return reserveResultRepository.save(diyReserveResultEntity);
    }
    // 獲取所選時段的當前PEO_COUNT
    public int getCurrentPeoCount(int selectedPeriod) {

        return 0;
    }
    public DiyReserveResultEntity findById(int id) {
        return reserveResultRepository.findById(id).get();
    }
    
    
    /**
     * @return
     */
    public List<DiyReserveResultEntity> setAllSummaryFromOrder() {  // 恆旭更動 -- //增\\將diyOrder 所有訂單以日期、時段groupBy---去計算人數，再放到資料庫
    	
    	DiyOrderService DOser = new DiyOrderService();
    	List<DiyOrderDTO> diyOrderDTOList = DOser.getPeoCount();
    	for (DiyOrderDTO diyOrderDTO : diyOrderDTOList) {
    		DiyReserveResultEntity diyReserveResultEntity = new DiyReserveResultEntity();
    		diyReserveResultEntity.setDiyReserveDate(diyOrderDTO.getDiyReserveDate());
    		diyReserveResultEntity.setDiyPeriod(diyOrderDTO.getDiyPeriod());
    		diyReserveResultEntity.setPeoCount(diyOrderDTO.getPeopleCount());
    		diyReserveResultEntity.setReserveStatus(0);
    		diyReserveResultEntity.setPeoLimit(20);
    		diyReserveResultEntity.setItemQuantity(20);
    		reserveResultRepository.save(diyReserveResultEntity);
    	}     	
        return null;
    }
    
public List<DiyReserveResultEntity> getAllSummaryFromOrder() {  // 恆旭更動  -- 找所有筆數彙總日期時段
        return reserveResultRepository.findAll();
    }


public DiyReserveResultEntity getOneSummary(Date diyReserveDate, Integer diyPeriod ) {  // 恆旭更動  -- 找單筆筆數彙總日期時段
    return reserveResultRepository.getOneSummary(diyReserveDate, diyPeriod);
}

public Optional<DiyReserveResultEntity> getOneSummaryNo(Integer diyReserveNo) {  // 恆旭更動  -- 找單筆數彙總日期時段
    return reserveResultRepository.findById(diyReserveNo);
}




//public DiyReserveResultEntity updataOneSummary(Date diyReserveDate, Integer diyPeriod,  ) { // 恆旭更動  -- 修改彙總日期時段
//	
//	diyReserveResultEntity
//	
//    return reserveResultRepository.getOneSummary(diyReserveDate, diyPeriod);
//}

public List<DiyReserveResultEntity> getAllGroups(){
        return reserveResultRepository.findAll();
}


}



