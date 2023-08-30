package com.cha102.diyla.sweetclass.classController;

import com.cha102.diyla.sweetclass.classModel.ClassService;
import com.cha102.diyla.sweetclass.classModel.ClassVO;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

@WebServlet("/getDesertCourseCat")
public class getClassCatServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setCharacterEncoding("UTF-8");
        res.setContentType("application/json; charset=UTF-8");
        String category = req.getParameter("category");
        PrintWriter out = res.getWriter();
        ClassService classService = new ClassService();
        List<ClassVO> courseList = classService.getAllClass();
        Set<Integer> catSet = new TreeSet();
        JSONArray jsonArray = new JSONArray();
        //Can add new SQL table for category mapping, also can implement add new category function if have time.
        String[] catmapping = {"糖果", "蛋糕", "餅乾", "麵包", "法式點心", "中式甜點", "其它"};
        for (ClassVO courses : courseList) {
            catSet.add(courses.getCategory());
        }
        for (Integer cat : catSet) {
            JSONObject jsonCourse = new JSONObject();
            jsonCourse.put("courseCatId", cat);
            jsonCourse.put("catName", catmapping[cat]);
            jsonArray.put(jsonCourse);
        }

        out.print(jsonArray.toString());
        out.flush();
    }

}
