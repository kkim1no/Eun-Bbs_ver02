<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Han's read</title>
</head>
<body>
<h1>수정 페이지 입니다..</h1>

<div class=bbs>
<form action ="update">
<ul>
<li>번호:${bbs.bno}
<input name="bno" type="hidden" value="${bbs.bno}"> </li>
<li>제목: <input name="title" type ="text" value="${bbs.title}"> </li>
<li>내용:<textarea name="cont" rows="3" cols="50" >${bbs.cont}</textarea> </li>
<li>첨부파일: ${bbs.contfile}
<input name="contfile" type ="hidden" value=" ${bbs.contfile}"> </li>
</ul>
<input id="update_btn" type="submit" value=Update>
</form>
</div>

</body>
