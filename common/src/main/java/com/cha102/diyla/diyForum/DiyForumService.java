package com.cha102.diyla.diyForum;

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

		return DFVO; // ??

	}
	
	public DiyForumVO updDF(int artiNo, int memId, int diyNo, String artiCont, int diyGrade) {

		DiyForumVO DFVO = new DiyForumVO();
		DFVO.setArtiNo(artiNo);
		DFVO.setMemId(memId);
		DFVO.setDiyNo(diyNo);
		DFVO.setArtiCont(artiCont);
		DFVO.setDiyGrade(diyGrade);
		dao.update(DFVO);

		return DFVO; //??

	}
	
	public void deleteDF(Integer artiNo) {
		dao.delete(artiNo);
	}

	public DiyForumVO getOneLat(Integer artiNo) {
		return dao.findByPrimaryKey(artiNo);
	}

	public List<DiyForumVO> getAll() {
		return dao.getAll();
	}

}
