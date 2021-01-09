class Matter < ApplicationRecord
  has_many :contact_logs, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :team
  belongs_to :user

  
  validates :name, :sales_person, :kana_sales_person, :email, :phone_number, :cell_phone_number, :postal_code, :municipality, :address, presence: true
  validates :kana_sales_person, format:{ with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみ使用できます"}, unless: Proc.new { |a| a.kana_sales_person.blank? }
  validates :email, format:{ with:/\A\S+@\S+\.\S+\z/, message: "が間違っています"}, unless: Proc.new { |a| a.email.blank? }
  validates :phone_number, :cell_phone_number, format:{ with:/\A\d{10,11}\z/, message: "は半角数字・11桁以内でお願いします" }, unless: Proc.new { |a| a.phone_number.blank? }
  validates :postal_code, format:{ with:/\A\d{7}\z/, message: "は半角数字・7桁以内でお願いします"}, unless: Proc.new { |a| a.postal_code.blank? }

  def self.search_phone_num(search)
    Matter.where('phone_number LIKE (?)', "%#{search}%").or(Matter.where('cell_phone_number LIKE (?)', "%#{search}%"))
  end

  def self.search_name(search)
    Matter.where('kana_sales_person LIKE (?)', "%#{search}%")
  end
end