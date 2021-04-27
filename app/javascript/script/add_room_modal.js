// document.addEventListener("turbolinks:load", () => {
console.log("hello");
let add_meeting_room_btn = document.querySelector(".circle");
let background = document.querySelector(".background-2");
let add_meeting_room_form = document.querySelector(".new-room-form");
// ボタンクリックでモーダル表示
add_meeting_room_btn.addEventListener("click", () => {
  background.classList.remove("invisible");
});
// モーダルをクリックしてもモーダルは消えない
add_meeting_room_form.addEventListener("click", e => {
  e.stopPropagation();
});
// 背景をクリックするとモーダルが消える
background.addEventListener("click", () => {
  background.classList.add("invisible");
});
// });
