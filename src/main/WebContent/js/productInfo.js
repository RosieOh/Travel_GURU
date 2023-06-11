// 버튼이랑 컨테이너
let prevBtns = document.querySelectorAll('.prev-btn');
let nextBtns = document.querySelectorAll('.next-btn');
let sliders = document.querySelectorAll('.slider');

// 이동거리랑 인덱스 초기화
const slideWidth = 320;
let slideIndexs = [];
let maxIndexs = [];


for(i = 0; i < prevBtns.length; i++)
{
	slideIndexs[i] = 0;
	maxIndexs[i] = sliders[i].childElementCount - 3;
	
	// 이전버튼 클릭
	(function(m) {
		prevBtns[m].addEventListener('click', () => {
		    slideIndexs[m]--;
		    if (slideIndexs[m] < 0) {
		        slideIndexs[m] = 0;
		    }
		    sliders[m].style.transform = `translateX(-${slideIndexs[m] * slideWidth}px)`;
		});		
	}(i));
	
	// 다음버튼 클릭
	(function(m) {
		nextBtns[m].addEventListener('click', () => {
		    slideIndexs[m]++;
		    if (slideIndexs[m] > maxIndexs[m]) {
		        slideIndexs[m] = maxIndexs[m];
		    }
		    sliders[m].style.transform = `translateX(-${slideIndexs[m] * slideWidth}px)`;
		});		
	}(i));
}
