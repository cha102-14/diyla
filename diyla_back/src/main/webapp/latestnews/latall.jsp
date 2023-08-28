<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<jsp:include page="/index.jsp"/>

<%
     LatService latSvc = new LatService();
        List<LatestnewsVO> list = latSvc.getAll();
        pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body bgcolor='white'>

<table>
    <tr>
        <th>公告編號</th>
        <th>公告內容</th>
        <th>操作</th>
    </tr>
    <tr>
    <% List<LatestnewsVO> scvList = (List)pageContext.getAttribute("list"); %>
    <% if (scvList != null) { %>
        <% for (LatestnewsVO a : scvList) { %>
            <tr>
                <td><%= a.getNewsNo() %></td>
                <td><%= a.getNewsContext() %></td>
                <td>
                <hr style="border-color: #fce5cd" >
                  <form method="post" action="latServlet">
                                        <input type="hidden" name="newsNo" value="<%= a.getNewsNo() %>">
                                       <input type="hidden" name="action" value="update_start">
                                       <button type="submit">✏️編輯</button>
                   </form>

                  <form method="post" action="latServlet">
                      <input type="hidden" name="newsNo" value="<%= a.getNewsNo() %>">
                      <input type="hidden" name="action" value="delete_latnews">
                      <button type="submit">❌刪除</button>
                  </form>


                </td>
            </tr>
        <% } %>
    <% } %>
    </tr>
</table>
</body>
</html>