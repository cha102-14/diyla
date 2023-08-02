package com.cha102.diyla.diyIng;

import java.util.List;

public interface DIYIngredientDAO_Interface {
	public void insert(DIYIngredientDAO LatestnewsVO);
    public void update(DIYIngredientDAO LatestnewsVO);
    public void delete(Integer newsNo);
    public DIYIngredientDAO findByPrimaryKey(Integer newsNo);
    public List<DIYIngredientDAO> getAll();
}