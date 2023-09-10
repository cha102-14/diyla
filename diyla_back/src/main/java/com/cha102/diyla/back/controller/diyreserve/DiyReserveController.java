package com.cha102.diyla.back.controller.diyreserve;

import com.cha102.diyla.diyOrder.DiyOrderDTO;
import com.cha102.diyla.diyreservemodel.DIYReserveVO;
import com.cha102.diyla.diyreservemodel.DiyReserveResultEntity;
import com.cha102.diyla.diyreservemodel.DiyReserveResultEntityRepository;
import com.cha102.diyla.diyreservemodel.DiyReserveResultService;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@RestController
@RequestMapping("/api/diy-reserve")
public class DiyReserveController {

	// @Resource是依賴注入的方式，使得控制器可以使用diyReserveService來執行預訂相關的業務邏輯。
	@Resource
	private DiyReserveResultService diyReserveService;
	@Resource
	private DiyReserveResultEntityRepository reserveResultRepository;

	// GetMapping查詢 PostMapping新增
	@GetMapping("/peoItemQuantityReport")
	public List<DIYReserveVO[]> getItemQuantityReport(
	// @RequestParam(value = "endDate",required = false) Date endDate,
	// @RequestParam("period") int period
	) {
		// 設定只能訂六十天內
		Calendar calendar = Calendar.getInstance();
		// 將當前日期加上60天，得到一個結束日期，表示預訂的時間範圍最多為60天。
		calendar.add(Calendar.DAY_OF_MONTH, 60);
		Date endDate = calendar.getTime();
		return diyReserveService.getItemQuantityByDateRange(endDate);
	}

	// 執行預訂
	@PostMapping("/reserve")
	public DiyReserveResultEntity makeReservation(@RequestBody DiyReserveResultEntity reservation) {
		// 檢查所選DIY_PERIOD是否已滿（PEO_COUNT >= 10）
		int selectedPeriod = reservation.getDiyPeriod();
		int currentPeoCount = diyReserveService.getCurrentPeoCount(selectedPeriod);

		if (currentPeoCount >= 10) {
			// 設定RESERVE_STATUS為1（不可預約）
			reservation.setReserveStatus(1);
		} else {
			// 設定RESERVE_STATUS為0（可預約）
			reservation.setReserveStatus(0);
		}

		// 設定PEO_LIMIT為剩餘可用位數
		reservation.setPeoLimit(10 - currentPeoCount);

		// 根據需要設定其他欄位（DIY_RESERVE_DATE、RESERVE_UPD_TIME、ITEM_QUANTITY）

		// 儲存預訂
		return diyReserveService.insert(reservation);
	}

	@GetMapping("/CreateVacancySummary") // 新增30天空彙總
	public List<DiyReserveResultEntity> getAllVacancySummary() { // 可新增訂單之後再去呼叫此方法，就不需要排程器了
		diyReserveService.newVacancyAllSummary();

		return null;

	};

	@GetMapping("/getAllSummary") // 拿所有彙總資料
	public List<DiyReserveResultEntity> getAllSummary() {
		List<DiyReserveResultEntity> diyReserveResultEntityList = getAllSummaryFromOrder();
//    	model.addAttribute("diyReserveResultEntityList",diyReserveResultEntityList);
//		getAllSummaryFromOrder();
		System.out.println(diyReserveResultEntityList);
		return diyReserveResultEntityList;

	};

	@GetMapping("/getOneSummaryMorning") // 拿單筆彙總資料 -- 早
	public List<DiyReserveResultEntity> getOneSummaryMorning(
			@RequestParam("selectedDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date diyReserveDate) {
		System.out.println(diyReserveDate);
		DiyReserveResultEntity diyReserveResultEntity = diyReserveService.getOneSummary(diyReserveDate, 0);
		List<DiyReserveResultEntity> diyReserveResultEntityList = new LinkedList<>();
		diyReserveResultEntityList.add(diyReserveResultEntity);
		System.out.println(diyReserveResultEntityList);
		return diyReserveResultEntityList;
	};

	@GetMapping("/getOneSummaryAfternoon") // 拿單筆彙總資料  -- 下午
	public List<DiyReserveResultEntity> getOneSummaryAfternoon(
			@RequestParam("selectedDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date diyReserveDate) {
		DiyReserveResultEntity diyReserveResultEntity = diyReserveService.getOneSummary(diyReserveDate, 1);
		List<DiyReserveResultEntity> diyReserveResultEntityList = new LinkedList<>();
		diyReserveResultEntityList.add(diyReserveResultEntity);
		System.out.println(diyReserveResultEntityList);
		return diyReserveResultEntityList;
	};

	@GetMapping("/getOneSummaryNight") // 拿單筆彙總資料  -- 晚
	public List<DiyReserveResultEntity> getOneSummaryNight(
			@RequestParam("selectedDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date diyReserveDate) {
		DiyReserveResultEntity diyReserveResultEntity = diyReserveService.getOneSummary(diyReserveDate, 2);
		List<DiyReserveResultEntity> diyReserveResultEntityList = new LinkedList<>();
		diyReserveResultEntityList.add(diyReserveResultEntity);
		System.out.println(diyReserveResultEntityList);
		return diyReserveResultEntityList;
	};

	@GetMapping("/diyResult/allPeriodResult")
	public List<DiyReserveResultEntity> getAllSummaryFromOrder() {

//		List<DiyReserveResultEntity> diyReserveResultEntityList_update = new LinkedList<>();
		List<DiyReserveResultEntity> diyReserveResultEntityList_DTO = diyReserveService.setSummaryFromOrderPeriod();
		List<DiyReserveResultEntity> diyReserveResultEntityList = diyReserveService.getAllSummaryFromOrder();
//    	model.addAttribute("diyReserveResultEntityList",diyReserveResultEntityList);
		for (DiyReserveResultEntity diyReserveResultEntity : diyReserveResultEntityList) {
			for (DiyReserveResultEntity diyReserveResultEntity_DTO : diyReserveResultEntityList_DTO) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				if (sdf.format(diyReserveResultEntity.getDiyReserveDate())
						.equals(sdf.format(diyReserveResultEntity_DTO.getDiyReserveDate()))
						&& diyReserveResultEntity.getDiyPeriod() == diyReserveResultEntity_DTO.getDiyPeriod()
						&& diyReserveResultEntity.getPeoCount() != diyReserveResultEntity_DTO.getPeoCount()) {

					
					diyReserveResultEntity.setPeoCount(diyReserveResultEntity_DTO.getPeoCount());
					diyReserveResultEntity.setPeoLimit(    ///////////////
							/*diyReserveResultEntity.getPeoLimit() -*/ diyReserveResultEntity_DTO.getPeoLimit());

					if (diyReserveResultEntity_DTO.getPeoCount() < 20) {
						diyReserveResultEntity.setReserveStatus(0);
					} else {
						diyReserveResultEntity.setReserveStatus(1);
					}
					Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
					diyReserveResultEntity.setReserveUpdTime(currentTimestamp);

					diyReserveResultEntity.setItemQuantity(diyReserveResultEntity_DTO.getPeoCount());

					reserveResultRepository.save(diyReserveResultEntity);

				} else {
				}

			}
		}

		System.out.println(diyReserveResultEntityList);
//		return diyReserveService.getAllSummaryFromOrder();
		return diyReserveResultEntityList;

	};

}
