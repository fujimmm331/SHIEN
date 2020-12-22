class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matters
  belongs_to :team

  PASSWORD_VALI = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_VALI, message: 'は半角英数字を含み、6文字以上でお願いします'}
  validates :name, presence: true

  # 簡単ログイン用のユーザー情報
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.hex(10)
      user.team_id = 1
    end
  end
end
