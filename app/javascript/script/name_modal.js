document.addEventListener("turbolinks:load", () => {
  let look_name_btns = document.querySelectorAll(".look-name-btn");
  let disclosure_name_modal = document.querySelector(".disclosure-user-modal");
  let background2 = document.querySelector(".background-2");
  let quit_btn = document.querySelector(".quit");
  console.log("hello");
  disclosure_name_modal.addEventListener("click", e => {
    e.stopPropagation();
  });
  background2.addEventListener("click", () => {
    background2.classList.add("invisible");
  });
  quit_btn.addEventListener("click", () => {
    background2.classList.add("invisible");
  });
});
