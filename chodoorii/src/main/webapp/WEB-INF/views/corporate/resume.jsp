<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/publish/corporate/css/basic.css" rel="stylesheet">

<jsp:include page="../header/header.jsp"></jsp:include>

<body>


	<div class="ResuemeBoard" style="height:800px; margin-top : 60px">
		<div class="resueme">
			<c:forEach var="dto" items="${dto.getContent()}" varStatus="status">
				<div class="one">
							<img src="${dto.user.imgPath}" style="height: 130px;"
								width="130px">	
					<div class="info">
						<span style="font-size: 20px;">${dto.user.name}</span><br>
						<h3>${dto.intro_dto.introduction_header}</h3>
					<c:forEach var="metadata" items="${metadatas.get(status.index).makePositionArray()}">
						<span style="color : blue;">#${metadata }</span>
					</c:forEach>
					
						<span style="color : blue;">#${metadatas.get(status.index).exp}</span>
						<c:if test="${metadatas.get(status.index).period !=null }"><span style="color : blue;">#${metadatas.get(status.index).period}</span></c:if>
						
					</div>
					<div class="btn-res">
						<button type="button" class="btn btn-primary" onclick="location.href='/resume/display/${dto.id}'">
							열람하기
						</button>
					
					</div>
				</div>
			</c:forEach>
			
		</div>
		<ol class="paging" style="position:absolute; top : 900px; left : 750px">
			
			<li><a href="/resume/lists?page=0"><<</a></li>
			
			  <c:forEach var="i" begin="1" end="${dto.getTotalPages()}">

     	      	<li><a class="${(i-1)==dto.getPageable().getPageNumber()?'selected':''}" href="/resume/lists?page=${i-1}">${i}</a></li>
	     
    		 </c:forEach>
			<li><a href="/corporate/resume?page='${dto.getTotalPages()}'">>></a></li>
		</ol>
	</div>





	<jsp:include page="../header/footer.jsp"></jsp:include>


</body>
</html>

<script>
	window.add

</script>

