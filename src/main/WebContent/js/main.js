const searchEl = document.querySelector(".search");
const searchInputEl = document.querySelector(".menu_search");

let wrap_on = false;

searchEl.addEventListener("click", () => {
  switch (wrap_on) {
    case true:
      searchInputEl.classList.remove("wrap_on");
      wrap_on = false;
      break;
    case false:
      searchInputEl.classList.add("wrap_on");
      wrap_on = true;
      break;
  }
  console.log(searchInputEl.className);
});
