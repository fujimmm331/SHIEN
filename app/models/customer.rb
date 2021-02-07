class Customer < ApplicationRecord
  has_one :car
  has_many :contact_logs, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :team
  belongs_to :user

  
  validates :name, :kana_name, :phone_number, :cell_phone_number, :postal_code, :municipality, :address, presence: true
  validates :kana_name, format:{ with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみ使用できます"}, unless: Proc.new { |a| a.kana_name.blank? }
  validates :email, format:{ with:/\A\S+@\S+\.\S+\z/, message: "が間違っています"}, unless: Proc.new { |a| a.email.blank? }
  validates :phone_number, :cell_phone_number, format:{ with:/\A\d{10,11}\z/, message: "は半角数字・11桁以内でお願いします" }, unless: Proc.new { |a| a.phone_number.blank? }
  validates :postal_code, format:{ with:/\A\d{7}\z/, message: "は半角数字・7桁以内でお願いします"}, unless: Proc.new { |a| a.postal_code.blank? }


  def self.search(params)

    phone_num = params[:phone_num] #電話番号
    sales_person = params[:name] #お客様名
    matter_id = params[:id] #案件ID

    case
    
    #電話番号、ID、お客様名に値がある or 電話番号、お客様名に値がある
    when ((phone_num.present?) && (matter_id.present?) && (sales_person.present?)) || (phone_num.present? && sales_person.present?)
      Matter.where("phone_number LIKE ? OR cell_phone_number LIKE ? ","%#{phone_num}%","%#{phone_num}%").where("kana_sales_person LIKE ?","%#{sales_person}%").includes(:user)

    #電話番号に値がある or 電話番号、IDに値がある
    when (phone_num.present?) || (phone_num.present? && matter_id.present?)
      Matter.where("phone_number LIKE ? OR cell_phone_number LIKE ?","%#{phone_num}%","%#{phone_num}%").includes(:user)
    
    #お客様名に値がある or お客様名、IDに値がある
    when (sales_person.present?) || (sales_person.present? && (matter_id.present?))
      Matter.where('kana_sales_person LIKE (?)', "%#{sales_person}%").includes(:user)

    #IDに値がある
    when matter_id.present?
      Matter.where(id: matter_id)

    #全て空の時
    else
      Matter.includes(:user)
    end
  end


  #show用のcsv出力
  def self.download_matter_csv(matter)
    CSV.generate do |csv|
      columns = %w(id 案件名 担当者 フリガナ Email 電話番号 携帯電話番号 郵便番号 住所)
      csv << columns
      values = %W(#{matter.id} #{matter.name} #{matter.sales_person} #{matter.kana_sales_person} #{matter.email} '#{matter.phone_number}' '#{matter.cell_phone_number}' #{matter.postal_code} #{matter.municipality}#{matter.address}#{matter.building})
      csv << values
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

  # カラムを指定してcsv出力
  def self.download_matters_csv_with_colmuns(matters, columns)
    CSV.generate do |csv|
      csv << columns #csvファイルのカラムを入れる

      # 選択したカラムからレコードを入れる処理
      matters.each do |matter|
        values = []
        columns.each do |column|
          value = matter[column]
          values << value
        end
        csv << values
      end
      # /選択したカラムからレコードを入れる処理
    end
  end

end