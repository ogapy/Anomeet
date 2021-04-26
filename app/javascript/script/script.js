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
});
