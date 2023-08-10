package com.cha102.diyla.diyForum;

import com.cha102.diyla.util.PageBean;

import java.util.List;

public class DiyForumService {

	private DiyForumDAO_Interface dao;

	public DiyForumService() {
		dao = new DiyForumDAO();
	}

	public DiyForumVO addDF(int memId, int diyNo, String artiCont, int diyGrade) {

		DiyForumVO DFVO = new DiyForumVO();
		DFVO.setMemId(memId);
		DFVO.setDiyNo(diyNo);
		DFVO.setArtiCont(artiCont);
		DFVO.setDiyGrade(diyGrade);
		dao.insert(DFVO);

		return DFVO; // 添加評論並傳回VO

	}

	public DiyForumVO updDF(int artiNo, int memId, int diyNo, String artiCont, int diyGrade) {

		DiyForumVO DFVO = new DiyForumVO();
		DFVO.setArtiNo(artiNo);
		DFVO.setMemId(memId);
		DFVO.setDiyNo(diyNo);
		DFVO.setArtiCont(artiCont);
		DFVO.setDiyGrade(diyGrade);
		dao.update(DFVO);

		return DFVO; //修改評論並傳回VO

	}

	public void deleteDF(Integer artiNo) {
		dao.delete(artiNo);
	}

	public DiyForumVO getOneLat(Integer artiNo) {
		return dao.findByPrimaryKey(artiNo);
	}
	/**
	 * 獲取所有評論。傳回一個包含多個 DiyForumVO 物件的 List，其中每個物件代表一個評論的資訊。
	 * List 中的元素將按照它們被添加的順序來排列。
	 * @return 包含多個評論資訊的 List，元素按照添加順序排列
	 */
	public List<DiyForumVO> getAll() {
		return dao.getAll();
	}
    //根據DIY品項編號、評論排序方式、星級排序方式和分頁條件，獲取相關評論資訊，傳回一個PageBean物件。
	public PageBean getAll(Integer diyNo, String commentSort, String starSort, PageBean pageBean) {
		return dao.getAll(diyNo,commentSort,starSort,pageBean);
	}

}

