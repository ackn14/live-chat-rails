class Message < ApplicationRecord
  # userに対して一対多で連携
  belongs_to :user

  # contentを必須に設定
  validates :content, presence: true
end
