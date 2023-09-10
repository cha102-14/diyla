<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassVO" %>
<%@ page import="com.cha102.diyla.sweetclass.classModel.ClassService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%
    ClassService classService = new ClassService();
    List<ClassVO> courses = classService.getAllClass(); // 從後端獲取課程資料


    StringBuilder eventsJson = new StringBuilder();
    for (ClassVO course : courses) {
    //只將上架課程和已結束課程放入日曆
    if (course.getClassStatus() == 0 || course.getClassStatus() == 2){
        int classSeq = course.getClassSeq();
        Date classDate = course.getClassDate();

        // 根據 classSeq 計算完整的開始和結束時間
        String startTime = "";
        String endTime = "";
        if (classSeq == 0) {
            startTime = "09:00:00";
            endTime = "12:00:00";
        } else if (classSeq == 1) {
            startTime = "14:00:00";
            endTime = "17:00:00";
        } else if (classSeq == 2) {
            startTime = "19:00:00";
            endTime = "22:00:00";
        }

        // 合併日期和時間，並格式化為 ISO 8601 格式
        String isoStartTime = classDate + "T" + startTime;
        String isoEndTime = classDate + "T" + endTime;
        eventsJson.append("{");
        eventsJson.append("\"title\": \"" + course.getClassName() + "\",");
        eventsJson.append("\"start\": \"" + isoStartTime + "\",");
        eventsJson.append("\"end\": \"" + isoEndTime + "\",");
        eventsJson.append("\"id\": \"" + course.getClassId() + "\"");
        eventsJson.append("}");
        eventsJson.append(",");
        }
    }
    // 移除最後一個逗號
    if (eventsJson.length() > 0) {
        eventsJson.deleteCharAt(eventsJson.length() - 1);
    }
%>
<%= "[" + eventsJson.toString() + "]" %>
