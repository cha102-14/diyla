<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.shoppongcart.*"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%

List<ShoppingCartVO> scvList = (List) request.getAttribute("shoppingCartList"); //EmpServlet.java(Concroller), 存入req的empVO物件

%>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>查詢結果</TITLE>
<style>
#item {
	/* background-color: green; */
	
}

.cartTable {
margin-left:auto; 
margin-right:auto;
}

.itemInfo {
	border-color: red;
}

.title {
	background-color: rgba(241, 243, 244);
	font-weight: bold;

}
</style>
</HEAD>
<BODY>



	會員編號: ${memId} 的購物車列表

	<table width="80%" class="cartTable" cellspacing="0" cellpadding="10px">
		<tr class="title">
			<td>商品名稱</td>
			<td>單價</td>
			<td>數量</td>
			<td>金額</td>
		</tr>

		<%
		if (scvList != null && !scvList.isEmpty()) {
		%>
		<%
		for (ShoppingCartVO cartItem : scvList) {
		%>
		<%
		//     CommodityService comService = new CommodityService();
		%>
		<tr class="row">
			<td></td>
			<td></td>

			<td class="itemInfo"><%=cartItem.getComAmount()%></td>
			<td class="itemInfo">商品編號: <%=cartItem.getComNo()%></td>
		</tr>
		<%
		}
		%>
		<%
		} else {
		%>
	<p>購物車為空</p>
	<%
	}
	%>
		<tr>

		</tr>
	<button type="button">清空</button>
	</table>

</BODY>
</HTML>