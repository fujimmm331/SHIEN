class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matters
  has_many :contact_logs

  #カラムの名前が異なるため、明示的に設定
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # /カラムの名前が異なるため、明示的に設定

  belongs_to :team

  PASSWORD_VALI = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: PASSWORD_VALI, message: 'は半角英数字を含み、6文字以上でお願いします'}
  validates :name, presence: true

  # 簡単ログイン用のユーザー情報
  def self.guest1
    find_or_create_by!(email: 'guest1@example.com') do |user|
      user.name = "ゲストユーザー1"
      user.password = SecureRandom.hex(10)
      user.team_id = 1
    end
  end

  def self.guest2
    find_or_create_by!(email: 'guest2@example.com') do |user|
      user.name = "ゲストユーザー2"
      user.password = SecureRandom.hex(10)
      user.team_id = 1
    end
  end
end
