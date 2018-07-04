<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
// 	function loadList(data) {
// 		//메시지 리스트를 그려줌
// 		var table = $("#msgTable");
// 		$("#msgTable tr:gt(0)").remove();
// 		$.ajax({
// 			url: "messageList",
// 			type: "post",
// 			dataType: "json",
			
// 		});
// 	}
// 	$(function(){
// 		function doWrite() {
// 			var name = $("#guestName").val();
// 			var pw = $("#password").val();
// 			var msg = $("#message").val();
// 			url: "write",
// 			type: "post",
// 			data: {"guestName" : name, "password" : pw, "message" : msg},
// 			dataType: "json",
// 			success : function(data) {
// 				loadList(data);
// 			}
// 		}
// 	});

</script>
<title>메시지 리스트</title>
	<style type="text/css">
		table{
			width: 600px;
			margin: 0 auto;
		}
		form {
			width: 400px;
			margin: 0 auto;
		}
		tr, td{
			text-align: center;
		}
		#form2{
			text-align: center;
		}
	</style>
</head>
<body>
	<%-- messgeList 속성에 들어있는 데이터를 하나씩 화면에 출력하기  --%>
<%-- 	${messageList} --%>
	<table id="msgTable">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>메시지</th>
		</tr>
		<c:forEach items="${viewData.messageList}" var = "message">
			<tr>
				<td>${message.id}</td>
				<td>${message.name}</td>
				<td>${message.message}</td>
				<td><button onclick="location.href='delete?id=${message.id}'">삭제</button></td>
			</tr>
		</c:forEach>
		
	</table>
	<br>
	<%--여기에 네비게이션 표시  --%>
	<!-- 처음 이전  1 2 3 4 5 6 7 8 9 10 다음  마지막 -->
	<!-- 1 2 3 4 5 다음 마지막 -->
	<!-- 처음 이전    11  12  13     20 --> 
	<form id="form2">
		<c:if test="${viewData.startPage !=1 }">
			<a href = "messageList?page=1">[처음]</a>
			<a href = "messageList?page=${viewData.startPage-1}">[이전]</a>
		</c:if>
		<c:forEach var = "pageNum" begin="${viewData.startPage}" end="${viewData.endPage < viewData.pageTotalCount ? viewData.endPage : viewData.pageTotalCount}">
			<c:choose>
				<c:when test="${pageNum == viewData.currentPage}">
					<b>[${pageNum}]</b>
				</c:when>
				<c:otherwise>
					<a href="messageList?page=${pageNum}">[${pageNum}]</a>	
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test = "${viewData.endPage < viewData.pageTotalCount}">
			<a href = "messageList?page=${viewData.endPage+1}">[다음]</a>
			<a href = "messageList?page=${viewData.pageTotalCount}">[마지막]</a>
		</c:if>
	</form>
	
	<form action="write" method="post">
		<fieldset>
			<legend> 메시지 입력</legend>
			<p><label>이름 : <input type="text" name="guestName" id="guestName"> </label></p>
			<p><label>암호 : <input type="password" name="password" id="password"> </label></p>
			<p>
				<textarea rows="3" cols="30" name="message" id="message"></textarea>
			</p>
		</fieldset>
			<input type="submit" value = "메시지 저장">
			<!--  <input type="submit" value = "메시지 저장" onclick="doWrite();"> -->	
		
	</form>
	
</body>
</html>

