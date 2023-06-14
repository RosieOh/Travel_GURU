<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/productCart/cart.css">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/body.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<script defer src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script defer src="${pageContext.request.contextPath}/js/main.js"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div class="page-container">
			<section class="cart">
				<div class="cart_information">
					<ul>
						<li>유효기간: 상품이 담긴 후 일주일까지</li>
						<li>항공스케줄이 변경된 경우 주문이 불가할 수 있습니다.</li>
						<li>출발일 기준 3일전 취소는 수수로 10%가 부과됨을 알려드립니다.</li>
					</ul>
				</div>
				<table class="cart_list">
					<form method="post" action="${pageContext.request.contextPath}/cart?cmd=delete">
						<thead>
							<tr>
								<td><input type="checkbox" id="selectAll"></td>
								<td colspan="2">상품정보</td>
								<td>옵션</td>
								<td>상품금액</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cart" items="${cartList}">
							<tr class="cart_list_detail">
								<td><input type="checkbox" name="delcheckbox" value="${cart.id}"></td>
								<td><img src="${pageContext.request.contextPath}/${cart.product_imgUrl_1}" alt="image"></td>
								<td><a href="#">${cart.product_name}</a><span class="cart_list_america">[${cart.product_category}]</span>
									<p>${cart.product_summary}</p> <span class="price">${cart.product_price}원</span></td>
								<td class="cart_list_option">
									<p>상품명: ${cart.product_summary}</p>
								</td>
								<td><span class="price">${cart.product_price}원</span><br></td>
							</tr>
						</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3"><input type="checkbox" id="selectItems">
									<button class="cart_list_optionbtn" id="deleteSelectedItemsBtn">선택상품
										삭제</button></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</form>
				</table>
				<div class="cart_mainbtns">
					<button onclick="location.href='${pageContext.request.contextPath}/product?cmd=info'" class="cart_bigorderbtn left">쇼핑 계속하기</button>
					<button class="cart_bigorderbtn right">주문하기</button>
				</div>
			</section>
			<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 선택 상품 삭제 버튼
        /*
        var deleteBtn = document.getElementById('deleteSelectedItemsBtn');
        deleteBtn.addEventListener('click', function() {
          var selectedItems = document.querySelectorAll('.cart_list_detail input[type="checkbox"]:checked');
          
          selectedItems.forEach(function(item) {
            var row = item.parentNode.parentNode;
            row.parentNode.removeChild(row);
          });
        });
        */
        
        // 전체 선택 체크박스
        var selectAllCheckbox = document.getElementById('selectAll');
        var selectItemsCheckbox = document.getElementById('selectItems');
        selectAllCheckbox.addEventListener('change', function() {
          var checkboxes = document.querySelectorAll('.cart_list_detail input[type="checkbox"]');
          checkboxes.forEach(function(checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
          });
          selectItemsCheckbox.checked = selectAllCheckbox.checked;
        });

        // 개별 선택 체크박스
        var itemCheckboxes = document.querySelectorAll('.cart_list_detail input[type="checkbox"]');
        itemCheckboxes.forEach(function(itemCheckbox) {
          itemCheckbox.addEventListener('change', function() {
            var checkedCount = document.querySelectorAll('.cart_list_detail input[type="checkbox"]:checked').length;
            selectAllCheckbox.checked = checkedCount === itemCheckboxes.length;
            selectItemsCheckbox.checked = checkedCount > 0;
          });
        });

        // 쇼핑
        /*
        var continueBtn = document.querySelector('.cart_bigorderbtn.left');
        continueBtn.addEventListener('click', function() {
          alert('더 많은 여행상품들이 준비되어 있습니다!');
        });
        */
    
        // 주문하기 버튼 이벤트 처리
        var orderBtn = document.querySelector('.cart_bigorderbtn.right');
        orderBtn.addEventListener('click', function() {
          alert('Travel Guru와 함께, 더 즐거운 여행으로 보답하겠습니다!');
        });
    });

    </script>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>