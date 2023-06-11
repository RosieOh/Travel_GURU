<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "user.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Travel_GURU</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" href="../css/body.css" />
<link rel="stylesheet" href="../css/footer.css" />
<script defer src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script defer src="./js/main.js"></script>
<script defer src="./js/body.js"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/signup.css" />
</head>
<style>
    .header {
        background-color: white;
    }
</style>
<body>
	<jsp:include page="../layout/header.jsp" />
	<section class="login">
		<div class="inner">
			<div class="container">
        <h2>회원가입을 환영합니다!</h2>
        <form name="joinForm" onsubmit="return join()">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="id" placeholder="아이디를 입력하세요" required>
                <span id="id-error" class="error-message"></span>
                <button type="button" id="check-id" onclick="idCheck()">중복확인</button>
				<input name="idDuplication" type="hidden" value="idUncheck"/>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="password2">비밀번호 확인</label>
                <input type="password" id="password2" name="password2" placeholder="비밀번호를 한 번 더 입력하세요" required>
                <span id="password2-error" class="error-message"></span>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="email을 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="tel" id="phone" name="phone" placeholder="휴대폰 번호를 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" placeholder="주소를 입력하세요" required>
            </div>
            <button type="submit">가입하기</button>
        </form>
    </div>
			
		</div>
	</section>
	<jsp:include page="../layout/footer.jsp" />
</body>

<script type="text/javascript">
	function join() {
		var joinForm = document.joinForm;
		var pwd = joinForm.password.value;
		var pwd2 = joinForm.password2.value;
		
		console.log(joinForm.idDuplication.value);
		
		if (joinForm.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요");
		}
		else if (pwd != pwd2) {
			alert("비밀번호를 동일하게 입력해주세요");
			joinForm.password2.focus();
		}
		else {		
			joinForm.method = "post";
			joinForm.action = "../user?cmd=join";
		}
	}
	
	function idCheck() {
		var joinForm = document.joinForm;
		var id = joinForm.id.value;
		
		if (id.length == 0 || id == "") {
			alert("아이디를 입력해주세요");
			joinForm.id.focus();
		} else {
			window.open("../user?cmd=idCheck&user_id=" + id, "hiddenFrame")
		}
	}
	
	function setIdUncheck() {
		document.joinForm.idDuplication.value = "idUncheck";
	}
</script>
</html>


