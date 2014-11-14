<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Han's read</title>

<style>

.thumb {
	float: left;
	width: 100px;
	height: 100px;
}
</style>
</head>

<body>
    	
	<h1>읽기 페이지 입니다.........</h1>

	<div id=bbs>
		<ul>
			<li>번호: ${bbs.bno}</li>
			<li>제목: ${bbs.title}</li>
			<li>내용: ${bbs.cont}</li>
			<li>게시일: ${bbs.regdate}</li>
			<li>조회수: ${bbs.vcount}</li>
			<li>댓글수: ${bbs.rcount}</li>
			<li>첨부파일: ${bbs.contfile}</li>
		</ul>

		<ul id="downloadUL">
			<!-- file download -->
	
		</ul>
		
	<a href="javascript:_list('${bbs.contfile }')">첨부파일 미리보기</a>	
	<br>
	</div>

	<form class=Delete action="delete">
		<input type="hidden" name="bno" value="${bbs.bno}"> <input
			id="delete_btn" type="submit" value=Delete>
	</form>

	<form class=Modify action="modify">
		<input type="hidden" name="bno" value="${bbs.bno}"> <input
			id="modify_btn" type="submit" value=Modify>
	</form>
	
	<a href="list">목록으로 돌아가기</a>

<!-- file Download  -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>

<script type="text/javascript">

   function _list(file){
	   
   
	   console.log(file)
	   if(file.length ==0){
		   alert("첨부파일 없음");   
	   }else{
	   /* 첨부파일보기 다시 눌렀을 때 중복으로 보여짐 막음 */
		   var element = document.getElementById("downloadUL");
		   while (element.firstChild) {
		     element.removeChild(element.firstChild);
		   }
		   
      var name = file.split(",");
      for(var i=0 ; len=i<name.length,len; i++ )  
    	  /* -1은 존재하지 않는다면을 뜻함 */
         if (name[i].indexOf('.jpg')!= -1){
         $("#downloadUL").append("<p><a href='/hanBbs/file/down?src="+name[i]+"'><image class='thumb' data-src='"+name[i]+"' src='/hanBbs/file/view/"+name[i]+"'/></a></p>");
         }else{
         $("#downloadUL").append("<p><a href='/hanBbs/file/down?src="+name[i]+"'><image class='thumb' data-src='"+name[i]+"' src='/resources/images/iconsets9.jpg'/></a></p>");
         }
   }
   }
</script>


</body>
</html>
