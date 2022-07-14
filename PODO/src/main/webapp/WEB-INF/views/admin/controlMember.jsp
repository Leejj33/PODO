<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="memberList" value="${map.memberList}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adiminPage-controlMember</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/controlMember.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>


</head>

<header>
    <div id="header">
        <section id="menu"> 
            <a href="3" >
                <img src="${contextPath}/resources/images/logo.png" id="home-logo">
            </a>
            <div><h1>관리자 페이지</h1></div>
        </section>
    </div>    

</header>

<div class="top-menu">
    <nav id="mainMenu">
        <a href="5">회원관리</a>
        <a href="4">상품관리</a>
        <a href="3">1:1 문의</a>
        <a href="6">신고관리</a>
    </nav>
    <nav id="mainMenu2">
        <a href="#">자주 묻는 질문(FAQ)</a>
    </nav>
</div>


<div class="option">
    <select>
        <option>탈퇴여부</option>
        <option>N</option>
        <option>Y</option>
    </select>
 
   
    <section class="basic">
        <form class="search1" action="#" method="post" id="search">
            <input id="search2" type="text" placeholder="회원명을 입력해주세요.">
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
    </section>
</div>



<div>
    <table>
        <thead>
            <tr id="head">
                <th><input type="checkbox"></th>
                <th>번호</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>가입날짜</th>
                <th> 상품</th>
                <th>포도알</th>
                <th>탈퇴여부</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test ="${empty memberList}">
                    <tr>
                        <th colspan="5">게시글이 존재하지 않습니다.</th>
                    </tr>
                </c:when>

                <c:otherwise>
                    
                    <c:forEach var="member" items="${memberList}">
                        
                        <tr>
                            <td ><input type="checkbox"></td>
                            <td >${member.memberNo}</td>
                            <td >${member.memberId}</td>
                            <td >${member.memberNickname}</td>
                            <td >${member.memberTel}</td>
                            <td>${member.memberAddress}</td>
                            <td >${member.createDate}</td>
                            <td >0</td>
                            <td >${member.memberGrape}</td>
                            <td >${member.secessionFlag}</td>
                        </tr>      
                    </c:forEach>      
                </c:otherwise>

            </c:choose>


        </tbody>
    </table>
    
    <div class="last">
        <div>
            <input type="checkbox" id="checkbox"><label for="checkbox"> 전체선택</label>
        </div>
        <div>
            <button id="stop">정지</button>
            <button id="delete">삭제</button>
        </div>
    </div>

    <div class="pagination">
        <c:set var="url" value="5?cp="/>


            <ul class="pagination">
                <!-- 첫 페이지로 이동 -->
                <li><a href="${url}1${sURL}">&lt;&lt;</a></li>

                <!-- 범위가 정해진 일반 for문 사용 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                    <c:choose>
                        <c:when test="${i == pagination.currentPage}">
                            <li><a class="current">${i}</a></li>
                        </c:when>

                        <c:otherwise>
                            <li><a href="${url}${i}${sURL}">${i}</a></li>        
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
                

                <!-- 끝 페이지로 이동 -->
                <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

            </ul>
    </div>

</div>
</body>
</html>