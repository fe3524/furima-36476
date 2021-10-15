class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birthday, presence: true

  has_many :items
  has_many :histories
end