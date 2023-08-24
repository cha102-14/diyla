<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <%@ page import="com.cha102.diyla.empmodel.*" %>


               <% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
               EmpVO empVO=(EmpVO)   request.getAttribute("empVO"); %>

                    <!DOCTYPE HTML PUBLIC>
                    <HTML>

                    <HEAD>
                         <link rel="stylesheet" href="../css/style.css">
                         <TITLE>管理員資料新增</TITLE>
                         <style>


                         </style>

                         <style>


                         </style>
                         <style>
                              .emp_insert_title {
                                   width: 100%;
                                   text-align: center;
                                   margin-bottom: 20px;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                                   font-size: 30px;
                                   padding: 50px 300px;
                                   background-color: #B45F06;
                                   border-radius: 5px;
                              }

                              .emp_content {
                                   width: 100%;
                                   text-align: center;
                                   margin-left: 45%;
                                   padding-left: 70%;
                                   margin-bottom: 20px;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                                   font-size: 18px;
                                   padding: 10px 300px;
                                   background-color: #FFEEDD;
                                   border-radius: 5px;
                                   background-color: #FFEEDD;
                              }
                         </style>
                    </HEAD>

                    <BODY>

                         <%-- 錯誤表列 --%>
                              <c:if test="${not empty errorMsgs}">
                                   <font style="color:red">請修正以下錯誤:</font>
                                   <ul>
                                        <c:forEach var="message" items="${errorMsgs}">
                                             <li style="color:red">${message}</li>
                                        </c:forEach>
                                   </ul>
                              </c:if>

                              <div class="emp_insert_title">

                              </div>
                              <div class="emp_content">
                              <FORM METHOD="post" ACTION="empInsert">
                                   <table>
                                        
                                             <tr>
                                                  <td>管理員名稱:</td>
                                                  <td><input type="TEXT" name="name"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpName()%>"
                                                            placeholder="請輸入管理員名稱" size="30" /></td>

                                             </tr>

                                             <!--input欄位要key in的內容要和inut欄位的name要有相對應關聯,才容易透過key的name得知該欄位的value內容-->


                                             <tr>
                                                  <td>管理員密碼:</td>
                                                  <td><input type="TEXT" name="password"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpPassword()%>"
                                                            placeholder="請輸入管理員密碼" size="30" /></td>
                                             </tr>
                                             <tr>

                                                  <td>管理員信箱:</td>
                                                  <td><input type="TEXT" name="email"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpEmail()%>"
                                                            placeholder="請輸入管理員信箱" size="30" /></td>
                                             </tr>
                                             <tr>

                                                  <td>管理員狀態:</td>
                                                  <td><select id="status_id" name="status">
                                                            <option select="selected" value="true">啟用</option>
                                                            <option value="false">停權</option>
                                                       </select></td>
                                             </tr>
                                             <!--  < value="<%= (empVO==null)? "" : empVO.getEmpStatus()%>" placeholder ="請輸入管理員狀態" size="30"/></td> -->

                                             <tr>
                                                  <!--TODO 1.先在insert.jsp 做下拉式選單  (功能類別)-->
                                                  <td><label for="funccategory_id">權限類別&nbsp &nbsp :&nbsp </label></td>
                                                  <td><select id="funccategory_id" name="funcClass">
                                                            <option select="selected" value="SHOP">商店管理員</option>
                                                            <option value="CLASS">課程管理員</option>
                                                            <option value="MASTER">師傅</option>
                                                            <option value="MEMADMIN">會員權限管理人員</option>
                                                            <option value="STORADMIN">倉儲管理人員</option>
                                                            <option value="CUSTORSERVICE">客服人員</option>
                                                            <option value="BACKADMIN">後台管理員</option>
                                                       </select></td>


                                             </tr>
                                             <tr>
                                                  <td>
                                                       <input type="SUBMIT" value="新增員工帳號">
                                                  <td>
                                             <tr>
                                                  <td>
                                                       <input type="SUBMIT" value="返回上一頁">
                                                  <td>
                                             </tr>
                                             </tr>
                                        
                                   </table>
                              </FORM>
                         </div>
                                        <jsp:include page="/index.jsp" />
                    </BODY>

                    </HTML>