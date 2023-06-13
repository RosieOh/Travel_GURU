const sns = document.querySelectorAll(".section_3 .sns_container .sns li");

const swiper_banner = new Swiper(".banner .swiper-container", {
  scrollbar: {
    el: ".banner .swiper-scrollbar",
    draggable: true,
  },
  navigation: {
    nextEl: ".banner .swiper-button-next",
    prevEl: ".banner .swiper-button-prev",
  },
  autoplay: {
    delay: 5000,
  },
});

const swiper_lineup = new Swiper(".section_1 .swiper-container", {
  navigation: {
    nextEl: ".section_1 .swiper-button-next",
    prevEl: ".section_1 .swiper-button-prev",
  },
  pagination: {
    el: ".section_1 .swiper-pagination",
    clickable: true,
  },
});

sns.forEach((img) => {
  img.addEventListener("mouseenter", () => {
    const sns_main = img.querySelector(".main");
    sns_main.classList.add("hover");
  });
  img.addEventListener("mouseleave", () => {
    const sns_main = img.querySelector(".main");
    sns_main.classList.remove("hover");
  });
});
