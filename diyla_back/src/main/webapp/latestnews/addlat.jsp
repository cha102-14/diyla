<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cha102.diyla.IatestnewsModel.*"%>
<jsp:include page="/index.jsp"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<link rel="stylesheet" href="../css/style.css">
  <style>
    *{
      box-sizing: border-box;
      margin: 0;
    }
    body{
		background-color:#fce5cd;
	}
    h1 {
      /* border: solid 1px red; */
      width: 100%;
      height: 60px;
      text-align: center;
      color: #fce5cd;
      background-color: #b45f06;
        line-height: 60px;
    }

    table {
      /* border: solid 1px green; */
      width: 100%;
      background-color: #fce5cd;
    }
    td.td1 {
      font-size: 20px;
      color: #b45f06;
      min-width: 20%;
      padding: 10px 0 10px 20px;
      /* border: 1px #b45f06 solid; */
      text-align: right;
    }

    td.td2 {
      width: 1vw-(20%);
    }

    #text {
      width: 90%;
      height: 60px;
    }

    div {
      background-color: #fce5cd;
    }

    #submit {
      margin-left: 86%;
      cursor: pointer;
    }
  </style>
</head>

<body>
  <h1>新增最新公告</h1>
  <FORM METHOD="post" ACTION="latServlet" enctype="multipart/form-data" name="form1">
  <table>
    <tr>
      <td class="td1">公告狀態</td>
      <td class="td2">
        <select name="annStatus">
          <option value="1">上架</option>
          <option value="0">下架</option>
        </select>
      </td>
    </tr>
    <tr>
      <td class="td1">公告內容</td>
      <td class="td2"> <input id="text" type="text" name="newsContext"> </td>
    </tr>
    <tr>
      <td class="td1">公告圖片</td>
      <td class="td2"> <input type="file" name="annPic" accept="image/*"></td>
    </tr>
    <input type="hidden" name="action" value="lat_insert">
    <input id="submit" type="submit" value="送出新增">
    </form>
  </table>

</body>

</html>