<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/member-profile.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>find-ID</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

            
        <div id="contaioner">
            <!-- body 전체 div -->
            <div id="item-page">
                <!-- 이미지 위 카테고리 클릭시 링크로 이동 -->


                <section id="profile-head">
                    <div id="user-profile-left">
                        <div id="user-image-area">
                            <image class="profile-image" src="${contextPath}/resources/images/logo.png" ></image>
                        </div>
                        <div id="user-name-left">${member[0].memberNickname}</div>
                        <div id="user-info">
                            <div id="user-podo">포도 : ${member[0].memberGrape}개</div>
                            <div id="user-items-count">상품 : ${boardCount}개</div>
                            
                        </div>
                        <div>
                            <button id="chatting">1대1 채팅하기</button>
                        </div>
                    </div>

                    <div id="user-profile-right">
                        <div id="user-name-right">${member[0].memberNickname}</div>
                        <div id="user-town">${member[0].memberAddress}</div>

                        <c:if test="${member[0].shopInfo != null}">
                            <div id="user-intro">${member[0].shopInfo}</div>
                        </c:if>

                        <c:if test="${member[0].shopInfo == null}">
                            <div id="user-intro">상점 소개가 없습니다.</div>
                        </c:if>

                        <div id="user-cutoff"><a href="#">신고/차단하기</a></div>
                        
                        
                        
                    </div>


                    
                </section>

                <div id="user-category">
                    <button id="item-list" type="button">상품 ${boardCount}개</button>
                    <button id="review-category" type="button">후기 5개</button>
                </div>

                <section id="seller-items">
               
                </section>
                



                <section id="reviews-area">

                </section> 

                      

            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    </main>

        <script>
            const memberNo = ${loginMember.memberNo}
        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/member/profile.js"></script>
    
</body>
</html>