class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :encrypted_password, presence: true
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end

  validates :date_of_birth, presence: true

  has_many :items
  has_many :purchase_records
end
