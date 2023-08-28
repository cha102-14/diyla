package com.cha102.diyla.diycate;

import com.cha102.diyla.util.PageBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DiyCateService {

    @Resource
    DiyCateRepository diyCateRepository;

    // 取得所有 DIY 分類資料，並進行分頁
    public Page<DiyCateEntity> getAllDiyCates(PageBean pageBean) {


        // 建立排序條件
        Sort sort = Sort.by(Sort.Direction.DESC, "diyNo");

        // 建立分頁設定
        Pageable pageable = PageRequest.of(pageBean.getPage() - 1, pageBean.getRows(),sort);

        // 呼叫 DIY 分類資料庫存取介面以進行查詢並回傳分頁結果
        return diyCateRepository.findAll(pageable);
    }

    // 根據 ID 取得特定 DIY 分類資料
    public DiyCateEntity getDiyCateById(int id) {
        return diyCateRepository.findById(id).orElse(null);
    }

    // 儲存 DIY 分類資料
    public void saveDiyCate(DiyCateEntity diyCate) {
        diyCateRepository.save(diyCate);
    }

    // 刪除指定 ID 的 DIY 分類資料
    public void deleteDiyCate(int id) {
        diyCateRepository.deleteById(id);
    }
}
