// viewを読み込むたびに実行
// document.addEventListener("turbolinks:load", () => {
let notification = document.querySelector(".fa-stack");
let notification_modal = document.querySelector(".notifications");
notification.addEventListener("click", () => {
  notification_modal.classList.toggle("invisible");
});
// });
