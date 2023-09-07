<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Base64"%>
<%@ page import="redis.clients.jedis.Jedis"%>
<%
    Jedis jedis = new Jedis("localhost", 6379);
    String content = jedis.get("content");
    String image_src = jedis.get("image");
    jedis.close();
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png" type="image/x-icon">
    <title>AboutUs</title>
    <!-- slider stylesheet -->
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>

        <!-- Custom styles for this template -->
        <link href="../css/style.css" rel="stylesheet"/>
        <!-- responsive style -->
        <link href="../css/responsive.css" rel="stylesheet"/>
        <link href="../css/aboutus.css" rel="stylesheet"/>
</head>

<body>
    <jsp:include page="/front_header.jsp"/>
    <div class="container">
                          <div class="column">
                             <img id="imagePre" src="data:image/jpeg;base64,<%= image_src %>" alt="圖片1"><br>

                              <div class="text">
                                  <h2> About Us </h2>
                                  <span id="editContent" contenteditable="false">
                                     <%= content %>
                                  </span>
                                  <br><br>
                              </div>
                          </div>
                      </div>

    <jsp:include page="/front_footer.jsp"/>


    <script src="js/jquery-3.4.1.min.js"></script>
    <%--<script src="js/bootstrap.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>