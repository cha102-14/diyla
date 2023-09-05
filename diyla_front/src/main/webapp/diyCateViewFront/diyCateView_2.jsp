<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DIY商品頁面</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">


<style type="text/css">

body#diyCateView{
width: 100%;
}

.diyCateView_container {
padding:0rem;
}
.filters label {
display: block;
}

img.diy_img{
width: 200px;
height: 200px;

}
div.grid{
item-align: center;
}

.grid-item {
  font-weight: bold;
  width: 220px;
  height: 230px;
  padding: 0.1rem;
  margin: 10px;
  text-align: center;
  background: lightgoldenrodyellow;
  float: left;
  }
    a{
    text-decoration: none;
    color: aliceblue;
    cursor: pointer;
  }
  a :hover{
  color: pink;
  }
.col-md-3{
  margin: 30px;	  	
}
</style>
</head>

<body id="diyCateView">
<jsp:include page="/front_header.jsp" />
<div class="diyCateView_container">

  
  <div class="row" style="width: 100%;">
    <div class="col-md-3">
      
            <strong>篩選</strong>
      <div id="output"></div>
      
      <div class="alert alert-info">請選擇品項</div>
      <p class="text-muted">篩選</p>
<p class="filters">

  
   <label><input type="checkbox" value=".a" id="小點心" />小點心</label>
   <label><input type="checkbox" value=".b" id="蛋糕"/>蛋糕</label>
  <label><input type="checkbox" value=".c"  id="塔派"/>塔派</label>
  <label><input type="checkbox" value=".d"  id="生乳酪"/>生乳酪</label>

    	
    	
    	
<%--     			<c:choose> --%>
<%-- 						<c:when test="${(DiyCateEntity.diyCategoryName) == 0}"> --%>
<!-- 								<p>小點心</p> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${(DiyCateEntity.diyCategoryName) == 1}"> --%>
<!-- 								<p>蛋糕</p> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${(DiyCateEntity.diyCategoryName) == 2}"> --%>
<!-- 								<p>塔派</p> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${(DiyCateEntity.diyCategoryName) == 3}"> --%>
<!-- 								<p>生乳酪</p> -->
<%-- 						</c:when> --%>
<%-- 				</c:choose> --%>
    
     <c:forEach var="DiyCateEntity" items="${diyCateList}">	
	</c:forEach>

  

  <c:forEach var="DiyCateEntity" items="${diyCateList}">
	</c:forEach>
</p>
      

      
      
    </div>
<!--     /.col-md-6 -->
    <div class="col-md-8" style="width: 100%;">
    <div class="grid">
    <c:forEach var="DiyCateEntity" items="${diyCateList}">
    			<c:choose>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 0}">
								<a class="diy_a" href="${ctxPath}/diyCate/diyCate_detail?diyNo=${DiyCateEntity.diyNo}">
									<div class="grid-item a" >						
									
										<div class="picture_A">
										<img class="diy_img" src="data:image/*;base64,${Base64.getEncoder().encodeToString(DiyCateEntity.diyPicture) }" alt="Image">
										</div>
										<div class="itemName_A">${DiyCateEntity.diyName} </div>
									
									
										<input type="hidden" name="diyNo" value="${DiyCateEntity.diyNo}">
									
									
									</div>
								</a>
								
						</c:when>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 1}">
							<a class="diy_a" href="${ctxPath}/diyCate/diyCate_detail?diyNo=${DiyCateEntity.diyNo}">
								<div class="grid-item b">
								
								
								<div class="picture_B">
								<img class="diy_img" src="data:image/*;base64,${Base64.getEncoder().encodeToString(DiyCateEntity.diyPicture) }" alt="Image">
								</div>
								<div class="itemName_B">${DiyCateEntity.diyName} </div>
								<input type="hidden" name="diyNo" value="${DiyCateEntity.diyNo}">
								</div>
							</a>
						</c:when>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 2}">
							<a class="diy_a" href="${ctxPath}/diyCate/diyCate_detail?diyNo=${DiyCateEntity.diyNo}">
								<div class="grid-item c">
								
								
								<div class="picture_C">
								<img class="diy_img" src="data:image/*;base64,${Base64.getEncoder().encodeToString(DiyCateEntity.diyPicture) }" alt="Image">
								</div>
								<div class="itemName_C">${DiyCateEntity.diyName} </div>
								<input type="hidden" name="diyNo" value="${DiyCateEntity.diyNo}">
								</div>
							</a>
						</c:when>
						<c:when test="${(DiyCateEntity.diyCategoryName) == 3}">
							<a class="diy_a" href="${ctxPath}/diyCate/diyCate_detail?diyNo=${DiyCateEntity.diyNo}">
								<div class="grid-item d">
								
								
								<div class="picture_D">
								<img class="diy_img" src="data:image/*;base64,${Base64.getEncoder().encodeToString(DiyCateEntity.diyPicture) }" alt="Image">
								</div>
								<div class="itemName_D">${DiyCateEntity.diyName} </div>
								<input type="hidden" name="diyNo" value="${DiyCateEntity.diyNo}">
								</div>
							</a>
						</c:when>
				</c:choose>
    
	</c:forEach>
    

	


	</div>
    </div>
    <!-- /.col-md-6 -->
  </div>
  <!-- /.row -->

  
  
  

  
 <jsp:include page="/front_footer.jsp" /> 
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>



<script>
$(document).ready(function() {
	 // executes when HTML-Document is loaded and DOM is ready
	console.log("document is ready");
	  

	  var $output = $('#output');
	  
	  
	 var $container = $('.grid').isotope({
	    itemSelector: '.grid-item',
	     layoutMode: 'fitRows'
	});
	  
	  
	  
	// filter with selects and checkboxes
	var $checkboxes = $('.filters input');

	$checkboxes.change( function() {
	  // map input values to an array
	  var inclusives = [];
	  var inclusives22 = [];
	  // inclusive filters from checkboxes
	  $checkboxes.each( function( i, elem ) {
	    // if checkbox, use value if checked
	    if ( elem.checked ) {
	       inclusives.push( elem.value);
	       inclusives22.push( elem.id);
	    }
	    
	    

	  

	    
	     if ( $.inArray(".c11", inclusives) !== -1 ) {
	      
	      alert('test');
	      var removeItem = ".b";
	      inclusives.splice( $.inArray(removeItem,inclusives) , 1 );
	      console.log(inclusives);
	    }    
	 
	    
	    
	    
	    
	});
	  
	  

	console.log(inclusives);
	  // combine inclusive filters
	  var filterValue = inclusives.length ? inclusives.join(', ') : '*';
	  var filterValue22 = inclusives22.length ? inclusives22.join(', ') : '*';
	  
	  console.log('filter value' + filterValue);
	  $output.text( filterValue22 );
	  $container.isotope({ filter: filterValue })
	});
	  
	  
	  
	  
	  
	  
	  

	  
	  
	  
	// document ready  
	});


$(window).load(function() {
	 // executes when complete page is fully loaded, including all frames, objects and images
	console.log("window is loaded");
	 
	  
	// window load  
	});
	
	
	
	
</script>

</body>
</html>