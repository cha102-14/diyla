package com.cha102.diyla.diyreservemodel;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

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

}
