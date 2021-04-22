window.onload = function() {
  let notification = document.querySelector(".fa-stack");
  let notification_modal = document.querySelector(".notifications");
  notification.addEventListener("click", () => {
    notification_modal.classList.toggle("invisible");
  });
};
