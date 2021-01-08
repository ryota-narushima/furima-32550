class User < ApplicationRecord
  # アソシエーション
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name_j
    validates :first_name_j
    validates :last_name_k
    validates :first_name_k
    validates :birth_day
  end

  # 半角英数字混合のパスワード
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  # ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :last_name_j
    validates :first_name_j
  end

  # ユーザー本名のフリガナは、全角（カタカナ）での入力が必須
  with_options format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :last_name_k
    validates :first_name_k
  end
end
