package com.cha102.diyla.back.controller.desertcourse.course.controller;

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
        List<IngStorageVO> ingList = new ArrayList<IngStorageVO>();
        List<FoodIng> resultList = new ArrayList<FoodIng>();
        IngStorageService ingStorageService = new IngStorageService();
        Gson gson = new Gson();
        ingList = ingStorageService.getAll();
        for(IngStorageVO ingredient : ingList) {
            FoodIng foodIng = new FoodIng();
            foodIng.setId(ingredient.getIngId());
            foodIng.setName(ingredient.getIngName());
            resultList.add(foodIng);
        }
        out.print(gson.toJson(resultList));
        out.flush();
    }
    class FoodIng{
        private int id;
        private String name;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
}
