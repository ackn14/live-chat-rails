class RoomChannel < ApplicationCable::Channel
  # どのチャネルとコネクションを確立するか指定
  def subscribed
    stream_from "room_channel"
  end

  # コネクションが切断された時に呼び出されるメソッド
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # ユーザーがチャットにメッセージを打ち込み、メッセージデータを受信するたびに呼び出されるメソッド
  def receive(data)
    user = User.find_by(email: data['email'])
    
    if message = Message.create(content: data['message'], user_id: user.id)
      ActionCable.server.broadcast 'room_channel', { message: data['message'], name: user.name, created_at: message.created_at }
    end
  end
end
