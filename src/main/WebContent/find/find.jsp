<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newloginc2.css">
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/body.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    <script defer src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/main.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/body.js"></script>
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
</head>
<body>
    <jsp:include page="../layout/header.jsp" />
    <div class="page-container">
        <form method="post" action="${pageContext.request.contextPath}/user?cmd=recoverPassword">
            <div class="login-form-container shadow">
                <div class="login-form-right-side">
                    <div class="top-logo-wrap"></div>
                    <div class="h1-container">
                    <h1>아이디 찾기</h1>
                    </div>
                    <p>더 많은 서비스를 이용해보세요!</p>
                </div>
                <div class="login-form-left-side">
                    <div class="login-top-wrap">
                        <span>계정이 있으신가요?</span>
                        <button class="create-account-btn shadow-light"><a href="../signin/signin.jsp">로그인</a></button>
                    </div>
                    <div class="login-input-container">
                        <div class="login-input-wrap input-id">
                            <i class="far fa-envelope"></i> <input id="email" name="email" placeholder="가입 시 사용한 이메일을 입력해주세요" type="email" required>
                        </div>
                    </div>
                    <div class="login-btn-wrap">
                        <button class="login-btn" type="button" onclick="showPasswordPopup()">아이디 찾기</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        // 비밀번호 팝업을 보여주는 함수
        function showPasswordPopup() {
            // 이메일 입력값 가져오기
            var emailInput = document.getElementById('email');
            var email = emailInput.value;

            // 비밀번호 팝업에 메시지를 포함하여 보여주기
            alert('해당 아이디는: ' + email);
        }
    </script>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
