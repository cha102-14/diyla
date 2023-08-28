package com.cha102.diyla.diyforummodel;

import com.cha102.diyla.util.PageBean;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.Predicate;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class DiyForumService {
	@Resource
	private DiyForumRepository diyForumRepository;
	public DiyForumVO addDF(DiyForumEntity diyForum) {

		diyForum.setCreateTime(new Timestamp(System.currentTimeMillis()));

		DiyForumEntity diyForumEntity = diyForumRepository.save(diyForum);

		DiyForumVO diyForumVO = new DiyForumVO();
		BeanUtils.copyProperties(diyForumEntity,diyForumVO);
		return diyForumVO; // 添加評論並傳回VO

	}

	public DiyForumEntity updDF(DiyForumEntity diyForum) {
		DiyForumEntity diyForumEntity = diyForumRepository.save(diyForum);
		return diyForumEntity; //修改評論並傳回VO

	}

	public void deleteDF(Integer artiNo) {
		diyForumRepository.deleteById(artiNo);
	}

	public DiyForumEntity getOneLat(Integer artiNo) {

		return diyForumRepository.findById(artiNo).get();

	}
	/**
	 * 獲取所有評論。傳回一個包含多個 DiyForumVO 物件的 List，其中每個物件代表一個評論的資訊。
	 * List 中的元素將按照它們被添加的順序來排列。
	 * @return 包含多個評論資訊的 List，元素按照添加順序排列
	 */
	public List<DiyForumVO> getAll() {

		List<DiyForumVO> diyForumVOList = new ArrayList<>();

		List<DiyForumEntity> list = diyForumRepository.findAll();
		for (DiyForumEntity diyForumEntity : list) {
			DiyForumVO diyForumVO = new DiyForumVO();
			BeanUtils.copyProperties(diyForumEntity,diyForumVO);

			diyForumVOList.add(diyForumVO);

		}
		return diyForumVOList;
	}
	//根據DIY品項編號、評論排序方式、星級排序方式和分頁條件，獲取相關評論資訊，傳回一個PageBean物件。
	public Page<DiyForumEntity> getAll(Integer diyNo, String commentSort, String starSort, PageBean pageBean) {

		// 查詢條件
		Specification<DiyForumEntity> spec = (root, query, builder) -> {
			List<Predicate> predicates = new ArrayList<>();
			if (diyNo != null) {
				predicates.add(builder.equal(root.get("diyNo"), diyNo));
			}
			return builder.and(predicates.toArray(new Predicate[0]));
		};
		Sort sort = null;

		if (Objects.nonNull(commentSort)) {

			sort = Sort.by(Sort.Direction.fromString(commentSort), "artiNo");
		}
		// 創建排序對象

		if (Objects.nonNull(starSort)) {
			sort = Sort.by(Sort.Direction.fromString(starSort), "diyGrade");
		}

		// 創建分頁
		Pageable pageable = PageRequest.of(pageBean.getPage() - 1, pageBean.getRows(),sort);

		// 執行分頁排序
		Page<DiyForumEntity> all = diyForumRepository.findAll(spec,pageable);

		//Set<Integer> memIds = all.get().map(DiyForumEntity::getMemId).collect(Collectors.toSet());

		// Page<DiyForumEntity> findalll = diyForumRepository.findalll(pageable);


		return all;
	}
	public void deleteById(Integer id) {
		diyForumRepository.deleteById(id);
	}

}



