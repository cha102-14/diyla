<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<h1>輸入框和按鈕範例</h1>

    <form action="your_action_url" method="post">

        <label for="selectNumber">選擇甜點名稱 </label>
        <select name="selectNumber" id="selectDIYNO">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select><br>

        <br>

        <label for="textbox">請輸入評論內容 </label>
        <textarea name="textbox" id="textbox" rows="4" cols="50"></textarea><br>

        <label for="selectNumber">請選擇分數 </label>
        <select name="selectNumber" id="selectGrade">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select><br>

        <br>

        <button type="submit" name="button1" value="submit1">新增評論</button>


    </form>


</body>
</html>