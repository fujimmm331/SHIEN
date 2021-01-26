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


  def self.search(params)
    case

    #両方値が入っていたら、空の配列を返す
    when (params[:phone_num].present?) && (params[:name].present?)
      Matter.where('phone_number LIKE (?)', "%#{params[:phone_num]}%").or(Matter.where('cell_phone_number LIKE (?)', "%#{params[:phone_num]}%")).where('kana_sales_person LIKE (?)', "%#{params[:name]}%")

    when params[:phone_num].present?
      Matter.where('phone_number LIKE (?)', "%#{params[:phone_num]}%").or(Matter.where('cell_phone_number LIKE (?)', "%#{params[:phone_num]}%")).includes(:user)

    when params[:name].present?
      Matter.where('kana_sales_person LIKE (?)', "%#{params[:name]}%").includes(:user)

    when params[:id].present?
      id = params[:id]
      Matter.where(id: id)

    #どちらも空っぽなら全てを取得
    else
      Matter.includes(:user)
    end
  end

  #index用のcsv出力
  def self.download_matters_csv(matters)
    CSV.generate do |csv|
      columns = %w(id 案件名 担当者 フリガナ Email 電話番号 携帯電話番号 郵便番号 住所)
      csv << columns
      matters.each do |matter| 
        values = %W(#{matter.id} #{matter.name} #{matter.sales_person} #{matter.kana_sales_person} #{matter.email} '#{matter.phone_number}' '#{matter.cell_phone_number}' #{matter.postal_code} #{matter.municipality}#{matter.address}#{matter.building})
        csv << values
      end
    end
  end

  #show用のcsv出力
  def self.download_matter_csv(matter)
    CSV.generate do |csv|
      columns = %w(id 案件名 担当者 フリガナ Email 電話番号 携帯電話番号 郵便番号 住所)
      csv << columns
      values = ["#{matter.id}", "#{matter.name}", "#{matter.sales_person}", "#{matter.kana_sales_person}", "#{matter.email}", "#{matter.phone_number}", "#{matter.cell_phone_number}", "#{matter.postal_code}", "#{matter.municipality}#{matter.address}#{matter.building}"]
      csv << values
    end
  end
end