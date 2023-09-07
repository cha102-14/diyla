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
                                   text-align: center;
                                   padding-left: 600px;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                                   font-size: 50px;
                                   font-style: #f3f3f3;
                                   background-color: #663709;
                              }

                              .emp_content {
                                   /* margin-top: 15%; */
                                   text-align: center;
                                   padding-left: 600px;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                                   font-size: 18px;
                                   background-color: #FFEEDD;
                              }

                             .error {
                                   color:red ;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                             }
                         </style>
                    </HEAD>

                    <BODY>
                              <jsp:include page="/index.jsp" />


                              <div class="emp_insert_title">
                                        新增管理員
                              </div>
                              <div class="emp_content">
                              <FORM METHOD="post" ACTION="empInsert" enctype="multipart/form-data">
                                   <table>
                                        
                                             <tr>
                                                  <td>管理員名稱:</td>
                                                  <td><input type="TEXT" name="name"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpName()%>"
                                                            placeholder="請輸入管理員名稱" size="30" />
                                             <span  id ="upFiles.errors" class="error">${errorMsgMap.empName}</span>

                                                            </td>

                                             </tr>

                                             <!--input欄位要key in的內容要和inut欄位的name要有相對應關聯,才容易透過key的name得知該欄位的value內容-->


                                             <tr>
                                                  <td>管理員密碼:</td>
                                                  <td><input type="TEXT" name="empPassword"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpPassword()%>"
                                                            placeholder="請輸入管理員密碼" size="30" />
                                                            <span  id ="upFiles.errors" class="error">${errorMsgMap.empPassword}</span>
                                                            </td>
                                             </tr>
                                             <tr>

                                                  <td>管理員信箱:</td>
                                                  <td><input type="TEXT" name="email"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpEmail()%>"
                                                            placeholder="請輸入管理員信箱" size="30" />
                                                            <span  id ="errors" class="error">${errorMsgMap.empEmail}</span>
                                                            </td>
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
                                                  <!-- 1.先在insert.jsp 做下拉式選單  (功能類別)-->
                                                  <td><label for="funccategory_id">權限類別&nbsp &nbsp :&nbsp </label></td>
                                                  <td><select id="funccategory_id" name="funcClass">
                                                            <option select="selected" value="SHOP">商店管理員</option>
                                                            <option value="CLASS">課程管理員</option>
                                                            <option value="MASTER">師傅</option>
                                                            <option value="MEMADMIN">會員權限管理人員</option>
                                                            <option value="STORADMIN">倉儲管理人員</option>
                                                            <option value="CUSTORSERVICE">客服人員</option>
                                                       </select></td>


                                             </tr>
                                             <label for="upFiles">照片:</label>
                                             <input id ="upFiles" name="upFiles" type="file" onclick="previewImage()"  onchange="hideContent('upFiles.errors');" />
                                             <div id="blob_holder"></div>
                                             </div>

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

                         <script>
                         //清除提示信息
                         function hideContent(d) {
                         document.getElementById(d).style.display = "none";
                         }
                         //照片上傳-預覽用
                         var filereader_support = typeof FileReader != 'undefined';
                         if (!filereader_support) {
                         	alert("No FileReader support");
                         }
                         acceptedTypes = {
                         		'image/png' : true,
                         		'image/jpeg' : true,
                         		'image/gif' : true
                         };
                         function previewImage() {
                         	var upfile1 = document.getElementById("upFiles");
                         	upfile1.addEventListener("change", function(event) {
                         		var files = event.target.files || event.dataTransfer.files;
                         		for (var i = 0; i < files.length; i++) {
                         			previewfile(files[i])
                         		}
                         	}, false);
                         }
                         function previewfile(file) {
                         	if (filereader_support === true && acceptedTypes[file.type] === true) {
                         		var reader = new FileReader();
                         		reader.onload = function(event) {
                         			var image = new Image();
                         			image.src = event.target.result;
                         			image.width = 100;
                         			image.height = 75;
                         			image.border = 2;
                         			if (blob_holder.hasChildNodes()) {
                         				blob_holder.removeChild(blob_holder.childNodes[0]);
                         			}
                         			blob_holder.appendChild(image);
                         		};
                         		reader.readAsDataURL(file);
                         		document.getElementById('submit').disabled = false;
                         	} else {
                         		blob_holder.innerHTML = "<div  style='text-align: left;'>" + "● filename: " + file.name
                         				+ "<br>" + "● ContentTyp: " + file.type
                         				+ "<br>" + "● size: " + file.size + "bytes"
                         				+ "<br>" + "● 上傳ContentType限制: <b> <font color=red>image/png、image/jpeg、image/gif </font></b></div>";
                         		document.getElementById('submit').disabled = true;
                         	}
                         }
                         </script>

                    </BODY>

                    </HTML>