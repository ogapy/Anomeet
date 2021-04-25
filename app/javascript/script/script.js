// viewを読み込むたびに実行
document.addEventListener("turbolinks:load", () => {
  //
  // 通知一覧
  //
  let notification = document.querySelector(".fa-stack");
  let notification_modal = document.querySelector(".notifications");
  notification.addEventListener("click", () => {
    notification_modal.classList.toggle("invisible");
  });

  //
  //新規ルーム作成
  //
  // let add_meeting_room_btn = document.querySelector(".circle");
  // let background = document.querySelector(".background-2");
  // let add_meeting_room_form = document.querySelector(".new-room-form");
  // // ボタンクリックでモーダル表示
  // add_meeting_room_btn.addEventListener("click", () => {
  //   background.classList.remove("invisible");
  // });
  // // モーダルをクリックしてもモーダルは消えない
  // add_meeting_room_form.addEventListener("click", e => {
  //   e.stopPropagation();
  // });
  // // 背景をクリックするとモーダルが消える
  // background.addEventListener("click", () => {
  //   background.classList.add("invisible");
  // });

  //
  // 名前開示の申請
  //
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
});
