# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  # メッセージに対して複数レコード保持するため複数形のsが付く
  has_many :messages
  # nameを必須に設定
  validates :name, presence: true
  # nameを３０文字制限
  validates :name, length: {maximum: 30}
end
