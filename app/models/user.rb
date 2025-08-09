class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
  VALID_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナで入力してください" }
  validates :birth_date, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字の両方を含めてください" }, if: -> { password.present? }
end
