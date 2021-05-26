// document.addEventListener("turbolinks:load", () => {
let look_name_btns = document.querySelectorAll(".look-name-btn");
let disclosure_name_modal = document.querySelector(".disclosure-user-modal");
let background2 = document.querySelector(".background-2");
let quit_btn = document.querySelector(".quit");
disclosure_name_modal.addEventListener("click", e => {
  e.stopPropagation();
});
background2.addEventListener("click", () => {
  background2.classList.add("invisible");
});
quit_btn.addEventListener("click", () => {
  background2.classList.add("invisible");
});

let target = document.querySelector(".chats-area");
target.scrollTop = target.scrollHeight + 100;
// チャット主によって表示切り替え
function event(mutationRecord) {
  var addedNode = mutationRecord[0].addedNodes["1"];
  var current_user = target.dataset.currentUserId;
  var chat_user = addedNode.dataset.chatUserId;
  if (current_user !== chat_user) {
    addedNode.classList.remove("flex-right");
    addedNode.firstElementChild.classList.remove("self");
    addedNode.firstElementChild.classList.add("friend");
    addedNode.children[1].classList.remove("invisible");
  }
  target.scrollTop = target.scrollHeight;
}
let observer = new MutationObserver(event);
observer.observe(target, { childList: true });
// });
