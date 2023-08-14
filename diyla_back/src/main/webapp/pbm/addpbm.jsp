<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp"/>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>新增常見問題</title>
<link rel="stylesheet" href="../css/style.css">
  <style>
    *{
      box-sizing: border-box;
      margin: 0;
    }
    body{
		background-color:#fce5cd;
		margin-left:300px;
	}

  </style>
</head>

<body>
  <h1>新增常見問題</h1>
  <FORM METHOD="post" ACTION="PbmController"  name="form1">
  <table>
    <tr>
      <td class="td1">問題分類</td>
      <td class="td2">
        <select name="pbmSort">
          <option value="0">課程</option>
          <option value="1">DIY</option>
          <option value="2">商店</option>
          <option value="3">其他</option>
        </select>
      </td>
    </tr>
    <tr>
      <td class="td1">問題標題</td>
      <td class="td2"><textarea name="pbmTitle" id="pbmTitle"></textarea></td>
    </tr>
    <tr>
      <td class="td1">問題內容</td>
      <td class="td2"><textarea name="pbmContext" id="pbmContext"></textarea></td>
    </tr>
    <input type="hidden" name="action" value="pbm_insert">
    <input id="submit" type="submit" value="送出新增">
    </form>
  </table>

</body>

</html>