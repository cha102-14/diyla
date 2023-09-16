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

                              div.picture{
                                   text-align:left;

                              }

                              .emp_insert_title {
                                   text-align:center;
                                   padding-left: 5px;
                                   padding-top: 10px;
                                   padding-bottom:10px;
                                   border-radius: 8px;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                                   font-size: 45px;
                                   color: #F6F4EB;
                                   background-color: #A75D5D;
                              }
                              
                              
                              .insertcontent{
                                   margin-left:300px;
                                   width: 73%;
                                   height: 100%;
                                   background-color: #FFEEDD;
                              }


                              .emp_content {
                                   text-align: center;
                                   padding-left: 250px;
                                   padding-top: 80px;
                                   padding-bottom:20px ;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                                   font-size: 18px;
                                   background-color: #FFEEDD;
                                   border-radius: 2px #952323;
                              }

                             .error {
                                   color:red ;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   font-weight: bold;
                             }

                             .subAcount{
                                   position: absolute;
                                   top: 75%;
                                   left: 55%;
                                   transform: translate(-50%, -50%);
                                   width: 120px;
                                   height: 25px;
                                   border-width: 1px;
                                   border-radius: 10px;
                                   background-color: #A3816A;
                                   cursor: pointer;
                                   outline: none;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   color: #F8F1F1;
                                   font-size: 15px;
                                   font-weight: bold;
                             }

                             .buttonback{
                                   position: absolute;
                                   top: 75%;
                                   left: 70%;
                                   transform: translate(-50%, -50%);
                                   width: 120px;
                                   height: 25px;
                                   border-width: 1px;
                                   border-radius: 10px;
                                   background-color: #A3816A;
                                   cursor: pointer;
                                   outline: none;
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   color: #F8F1F1;
                                   font-size: 15px;
                                   font-weight: bold;

                             }

                             .blob_holder{
                                   border : 2px solid black;

                             }

                             input.inputtext {
                                   border: 1px solid #B26021;
                                   margin: 5px;
                                   border-radius: 0.5rem;
                                   font-size: 1rem;
                                   color: #B26021;
                                   height: 25px;
                                   letter-spacing: 1px;
                              }

                              input.inputtext:focus {
                                   outline: 1.5px solid #B26021;
                                   box-shadow: 2px;
                              }

                              #status_id{
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   text-align: center;
                                   white-space: 20px;
                                   white-space: p;
                                   font-size: 15px; /*文字大小*/
                                   color: #594545; /*文字顏色*/
                                   border-radius: 10px;
                                   font-weight: bold;

                              }

                              #funccategory_id {
                                   font-family: "微軟正黑體", Arial, sans-serif;
                                   text-align: center;
                                   font-size: 15px; /*文字大小*/
                                   color: #594545; /*文字顏色*/
                                   border-radius: 10px;
                                   font-weight: bold;
}

                         </style>
                    </HEAD>

                    <BODY>
                              <jsp:include page="/index.jsp" />

                         <div class="insertcontent">
                              <div class="emp_insert_title">
                                   <svg width="55px" height="55px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd" clip-rule="evenodd" d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22ZM12.75 9C12.75 8.58579 12.4142 8.25 12 8.25C11.5858 8.25 11.25 8.58579 11.25 9L11.25 11.25H9C8.58579 11.25 8.25 11.5858 8.25 12C8.25 12.4142 8.58579 12.75 9 12.75H11.25V15C11.25 15.4142 11.5858 15.75 12 15.75C12.4142 15.75 12.75 15.4142 12.75 15L12.75 12.75H15C15.4142 12.75 15.75 12.4142 15.75 12C15.75 11.5858 15.4142 11.25 15 11.25H12.75V9Z" fill="#F6F4EB"></path> </g></svg>                                      新增管理員
                                   &nbsp&nbsp&nbsp
                              </div>
                              <div style="background-color: aqua;">
                              <div class="emp_content">
                              <FORM METHOD="post" ACTION="empInsert" enctype="multipart/form-data">
                                   <table>
                                        
                                             <tr>
                                                  <td>管理員名稱:</td>
                                                  <td><input type="TEXT" class="inputtext" name="name"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpName()%>"
                                                            placeholder="請輸入管理員名稱" size="30" />
                                             <span  id ="upFiles.errors" class="error">${errorMsgMap.empName}</span>

                                                            </td>

                                             </tr>

                                             <!--input欄位要key in的內容要和inut欄位的name要有相對應關聯,才容易透過key的name得知該欄位的value內容-->


                                             <tr>
                                                  <td>管理員密碼:</td>
                                                  <td><input type="password" class="inputtext" name="empPassword"
                                                            value="<%= (empVO==null)? "" : empVO.getEmpPassword()%>"
                                                            placeholder="請輸入管理員密碼" size="30" />
                                                            <span  id ="upFiles.errors" class="error">${errorMsgMap.empPassword}</span>
                                                            </td>
                                             </tr>
                                             <tr>

                                                  <td>管理員信箱:</td>
                                                  <td><input type="TEXT" class="inputtext" name="email"
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
                                                  <div class="selectType">
                                                  <td><label for="funccategory_id">權限類別&nbsp &nbsp :&nbsp </label></td>
                                                  <td><select id="funccategory_id" name="funcClass">
                                                            <option select="selected" value="SHOP">商店管理員</option>
                                                            <option value="CLASS">課程管理員</option>
                                                            <option value="MASTER">師傅</option>
                                                            <option value="MEMADMIN">會員權限管理人員</option>
                                                            <option value="STORADMIN">倉儲管理人員</option>
                                                            <option value="CUSTORSERVICE">客服人員</option>
                                                       </select></td>

                                                       
                                                  </div>     


                                             </tr>
                                             
                                             </div>


                                   </table>
                                   <div class="picture">
                                        <label for="upFiles">照片:</label>
                                        <input id ="upFiles" name="upFiles" type="file" onclick="previewImage()"  onchange="hideContent('upFiles.errors');" />
                                        <div id="blob_holder"></div>
                                   </div>
                                   <tr>
                                        <td>
                                             <br>
                                             <input class="subAcount" type="SUBMIT" value="新增員工帳號">
                                        <td>
                                   <tr>
                                        <td>
                                             <br>
                                             <input class="buttonback" type="button" value="返回上一頁" onclick="redirectToPage()">
                                        </td>
                                   </tr>
                                   </tr>
                                   <a href ="/diyla_back/emp/empShowAll.jsp"></a>
                              </FORM>
                         </div>
                         </div>
                    </div>

                         <script>
                         function redirectToPage(){
                              window.location.href = "/diyla_back/emp/empShowAll.jsp";
                         }

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
                         			image.height = 125;
                         			// image.border = 2;
                                        
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