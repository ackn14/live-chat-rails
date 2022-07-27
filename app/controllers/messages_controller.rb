class MessagesController < ApplicationController
  # ログイン済みか確認
  before_action :authenticate_user!, only: ["index"]
  # メッセージ一覧取得
  def index
    # メッセージテーブルから全件取得
    messages = Message.all
    # メッセージデータをループ処理してmessages_arrayに格納
    messages_array = messages.map do |message|
      {
        id: message.id,
        user_id: message.user.id,
        name: message.user.name,
        content: message.content,
        email: message.user.email,
        created_at: message.created_at
      }
    end
  render json: messages_array, status: 200
  end
end
