<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Han's Create</title>

<style>

.thumb {
	list-style: none;
	float: left;
	width: 100px;
	height: 100px;
}
</style>

</head>
<body>

<h1>Create page</h1>
<P>  The time on the server is ${serverTime}. </P>


<div calss="Create">
<form action ="insert"> <!-- next url -->
Title<input name="title" type ="text">
Userid<input name="userid" type ="text">
Cont<input name="cont" type ="text">

<ul class="uploadUL"> <!-- file upload  -->

</ul>

<input id="input_btn" type="submit" value="Submit">
</form>
</div>

<!-- file upload  -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.js"></script>
<script>
function updateResult(data){

	console.log(data);
		$(".uploadUL").append("<input type='hidden' name=contfile value='"+data.fileName+"'></p>");
		
		if(data.suffix == '.jpg'){
			$(".uploadUL").append("<li><a href='/hanBbs/file/down?src="+data.fileName+"'><image class='thumb' src='/hanBbs/file/view/"+data.fileName+"'/></li>");
			/* $(".uploadUL").append("<li><image class='thumb' data-src='"+data.fileName+"' src='/web/file/view/"+ data.fileName+"'/></a></li>"); */
		}else{
			$(".uploadUL").append("<li><a href='/hanBbs/file/down?src="+data.fileName+"'><image class='thumb' data-src='"+data.fileName+"' src='/resources/images/iconsets9.jpg'/></a></li>");
		}


}
</script>

<form target="zero" action="/hanBbs/file/upload" method="post" enctype="multipart/form-data" >
	<input type='file' name='file'><input type='submit' value="UPLOAD">
</form>

<iframe name="zero" width="0" height="0" >
</iframe>

<!-- end file upload -->



</body>
</html>