import consumer from "./consumer2";
window.onload = function() {
  consumer.subscriptions.create("NotificationChannel", {
    received(data) {
      const notifications = document.querySelector(".notifications-area");
      notifications.insertAdjacentHTML(
        "beforeend",
        data["notification_content"]
      );
    },

    speak: function(receiver_id, chat_id) {
      return this.perform("speak", {
        receiver_id: receiver_id,
        chat_id: chat_id
      });
    }
  });

  let ref = location.pathname;
  let result = ref.match("/meeting_rooms/" | /[0 - 9]/);
  console.log(result);
  if (result) {
    console.log("hello");
    const disclosure_user_btn = document.querySelector(".disclosure-user-btn");
    const disclosure_user_form = document.querySelector(
      ".disclosure-user-form"
    );
    if (disclosure_user_btn) {
      console.log("how are you");
      disclosure_user_btn.addEventListener("click", e => {
        // formのdata属性からroomのidを取得
        const receiver_id = disclosure_user_form.dataset.receiverId;
        const chat_id = disclosure_user_form.dataset.chatId;
        appRoom.speak(receiver_id, chat_id);
        e.preventDefault();
      });
    }
  }
};
