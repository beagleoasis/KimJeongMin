<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="research">
	<!-- <form> -->
	<div class="input-group">
		<input type="text" class="form-control" size="50" placeholder="Search"
			onkeypress="enterKey();">
		<div class="input-group-btn">
			<button type="button" class="btn btn-danger search"
				onclick="sendKeyword();">Search</button>
			<button class="btn btn-danger write">
				<a href="../cs/write">글쓰기</a>
			</button>
		</div>
	</div>
	<!-- <div class="input-group-btn write">
		                        <button class="btn btn-danger write"><a href="SHW_board.html">글쓰기</a></button>
		                    </div> -->
	<!-- </form> -->
</div>