import consumer from "./consumer";
window.onload = function() {
  const appRoom = consumer.subscriptions.create("MeetingRoomsChannel", {
    received(data) {
      const chatMessages = document.querySelector(".chats-area");
      chatMessages.insertAdjacentHTML("beforeend", data["chat_content"]);
      chatMessages.scrollTop = chatMessages.scrollHeight;
    },

    speak: function(chat_content, meeting_room_id) {
      return this.perform("speak", {
        chat_content: chat_content,
        meeting_room_id: meeting_room_id
      });
    }
  });

  let ref = location.pathname;
  let result = ref.match("/meeting_rooms/" | /[0 - 9]/);
  // URLチェック
  if (result) {
    const chat_btn = document.querySelector(".chat-form-btn");
    const chat_form = document.querySelector(".chat-form");
    chat_btn.addEventListener("click", e => {
      // formのdata属性からroomのidを取得
      const meeting_room_id = document.querySelector(".chat-form-area").dataset
        .meetingRoomId;
      appRoom.speak(chat_form.value, meeting_room_id);
      chat_form.value = "";
      e.preventDefault();
    });
  }
};
