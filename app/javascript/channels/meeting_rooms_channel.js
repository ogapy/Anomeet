import consumer from "./consumer";
window.onload = function() {
  const appRoom = consumer.subscriptions.create("MeetingRoomsChannel", {
    received(data) {
      console.log(data);
      return alert(data["chat_content"]);
    },

    speak: function(chat_content) {
      return this.perform("speak", { chat_content: chat_content });
    }
  });
  // URLチェック
  if (/meeting_rooms/.test(location.pathname)) {
    const chat_btn = document.querySelector(".chat-form-btn");
    const chat_form = document.querySelector(".chat-form");
    chat_btn.addEventListener("click", e => {
      appRoom.speak(chat_form.value);
      chat_form.value = "";
      e.preventDefault();
    });
  }
};
