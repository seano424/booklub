import consumer from "./consumer";

const initRoomCable = () => {
  const chatContainer = document.querySelector('.chat')
  const messagesContainer = document.getElementById('messages');
  console.log(messagesContainer)
  if (messagesContainer) {
    const id = messagesContainer.dataset.roomId;
    consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        chatContainer.scrollTop = chatContainer.scrollHeight
      },
    });
  }
}

export { initRoomCable };
