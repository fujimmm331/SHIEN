class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :team_matters
  has_many :matters, through: :team_matters
  belongs_to :team

  PASSWORD_VALI = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_VALI, message: 'should include English and numbers,and can be used only in half-width'}
  validates :name, presence: true

  # 簡単ログイン用のユーザー情報
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
      user.team_id = 1
    end
  end
end
