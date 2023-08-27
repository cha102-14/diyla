package com.cha102.diyla.diyforum;

import com.cha102.diyla.util.PageBean;

import java.util.List;

public interface DiyForumDAO_Interface {
	public void insert(DiyForumVO DiyForumVO);   //插入（新增）一筆 DIY 評論的資料。
    public void update(DiyForumVO DiyForumVO);   //更新一筆 DIY 評論的資料。
    public void delete(Integer artiNo);          //刪除指定編號（artiNo）的 DIY 評論資料。
    public DiyForumVO findByPrimaryKey(Integer artiNo);  //根據指定編號（artiNo）尋找並回傳對應的 DIY評論資料。
    public List<DiyForumVO> getAll();   //取得所有的 DIY 評論資料，並以列表形式回傳。
    
    public PageBean getAll(Integer diyNo, String commentSort, String starSort, PageBean pageBean);
/*取得指定 DIY 編號（diyNo）以及設定排序方式的 DIY 評論資料。
 * commentSort 和 starSort 參數用於指定評論排序和星級排序的方式。pageBean 參數用於分頁處理。
 */

}