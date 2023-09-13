package com.cha102.diyla.back.controller.desertcourse.course.controller;

import com.cha102.diyla.sweetclass.classModel.ClassINGVO;
import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.ingModel.IngStorageService;
import com.cha102.diyla.sweetclass.ingModel.IngStorageVO;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/getIngredientList")
public class GetFoodIngredientListServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        PrintWriter out = res.getWriter();
        //宣告用的到的參數
        ClassService classService = new ClassService();
        IngStorageService ingStorageService = new IngStorageService();
        List<IngStorageVO> ingList = new ArrayList<IngStorageVO>();
        List<FoodIng> resultList = new ArrayList<FoodIng>();
        Gson gson = new Gson();
        Integer courseId = null;
        try {
            courseId = Integer.parseInt(req.getParameter("courseId"));
        } catch(NumberFormatException nfe) {
            courseId = null;
        }
        ingList = ingStorageService.getAll();
        //若無提供courseId則是將取得的所有ingList回傳給網頁
        if(courseId == null) {
            for (IngStorageVO ingredient : ingList) {
                FoodIng foodIng = new FoodIng();
                foodIng.setId(ingredient.getIngId());
                foodIng.setName(ingredient.getIngName());
                foodIng.setAmount(0);
                resultList.add(foodIng);
            }
            out.print(gson.toJson(resultList));
            out.flush();
        } else {
            //若有courseId的情況下, 取得該course的inglist
            List<ClassINGVO> classIngList = classService.getOneClassIngID(courseId);
            IngStorageVO ingStorageVO = null;
            for(ClassINGVO courseIng : classIngList) {
                FoodIng foodIng = new FoodIng();
                ingStorageVO = ingStorageService.getOneIngStorage(courseIng.getIngId());
                foodIng.setId(courseIng.getIngId());
                foodIng.setAmount(courseIng.getIngNums());
                foodIng.setName(ingStorageVO.getIngName());
                resultList.add(foodIng);
            }
            out.print(gson.toJson(resultList));
            out.flush();
        }
    }
    class FoodIng{
        private int id;
        private String name;
        private int amount;
        public int getId() {
            return id;
        }
        public int getAmount() {
            return amount;
        }
        public void setId(int id) {
            this.id = id;
        }
        public void setAmount(int amount) {
            this.amount = amount;
        }
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
}
