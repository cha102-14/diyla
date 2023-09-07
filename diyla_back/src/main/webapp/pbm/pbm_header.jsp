<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/index.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>論壇</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/art_header.css">
    <style>
        body{
    margin-left:280px;
    }
    #pbm_select{
        width: 300px;
    }

    </style>
</head>

<body>
    <div class="art_header">
        <h1>常見問題</h1>
        <div>
            <span><a href="pbmall.jsp">查看常見問題</a></span>
            <span><a href="addpbm.jsp">新增常見問題</a> </span>
                <jsp:useBean id="pbmSvc" scope="page" class="com.cha102.diyla.commonproblemmodel.PbmService" />
            <span>
                      <b>選擇員工編號:</b>
                    <FORM METHOD="post" ACTION="PbmController" style="display: inline-block;">
                      <select id="pbm_select" size="1" name="pbmNo">
                        <c:forEach var="pbmVO" items="${pbmSvc.all}" >
                         <option  value="${pbmVO.pbmNo}">${pbmVO.pbmTitle}
                        </c:forEach>
                      </select>
                      <input type="hidden" name="action" value="getOne_For_Display">
                      <input type="submit" value="送出">
                   </FORM>
            </span>
        </div>
    </div>

</body>

</html>