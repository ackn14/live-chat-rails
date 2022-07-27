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
    # emailをもとにfind_byメソッドでユーザーを取得
    user = User.find_by(email: data['email'])

    # messageレコードを作成し、成功したらメッセージ内容をフロントエンドに送信
    if message = Message.create(content: data['message'], user_id: user.id)
      # room_channelチャネルに接続しているWebブラウザにデータを送信
      ActionCable.server.broadcast 'room_channel', {
        message: data['message'],
        name: user.name,
        message.created_at
      }
    end
end
