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
    customer_name = params[:name] #お客様名
    customer_id = params[:id] #案件ID

    case
    
    #電話番号、ID、お客様名に値がある or 電話番号、お客様名に値がある
    when ((phone_num.present?) && (customer_id.present?) && (customer_name.present?)) || (phone_num.present? && customer_name.present?)
      Customer.where("phone_number LIKE ? OR cell_phone_number LIKE ? ","%#{phone_num}%","%#{phone_num}%").where("kana_name LIKE ?","%#{customer_name}%").includes(:user)

    #電話番号に値がある or 電話番号、IDに値がある
    when (phone_num.present?) || (phone_num.present? && customer_id.present?)
      Customer.where("phone_number LIKE ? OR cell_phone_number LIKE ?","%#{phone_num}%","%#{phone_num}%").includes(:user)
    
    #お客様名に値がある or お客様名、IDに値がある
    when (customer_name.present?) || (customer_name.present? && (customer_id.present?))
      Customer.where('kana_name LIKE (?)', "%#{customer_name}%").includes(:user)

    #IDに値がある
    when customer_id.present?
      Customer.where(id: customer_id)

    #全て空の時
    else
      Customer.includes(:user)
    end
  end


  #show用のcsv出力
  def self.download_customer_csv(customer)
    CSV.generate do |csv|
      columns = %w(id お客様名 お客様名（フリガナ） Email 電話番号 携帯電話番号 郵便番号 住所 趣味 セールスメモ)
      csv << columns
      values = %W(#{customer.id} #{customer.name} #{customer.kana_name} #{customer.email} '#{customer.phone_number}' '#{customer.cell_phone_number}' #{customer.postal_code} #{customer.municipality}#{customer.address}#{customer.building} #{customer.hobby} #{customer.memo})
      csv << values
    end
  end

  #index用のcsv出力
  def self.download_customers_csv(customers)
    CSV.generate do |csv|
      columns = %w(id お客様名 お客様名（フリガナ） Email 電話番号 携帯電話番号 郵便番号 住所 趣味 セールスメモ)
      csv << columns
      customers.each do |customer| 
        values = %W(#{customer.id} #{customer.name} #{customer.kana_name} #{customer.email} '#{customer.phone_number}' '#{customer.cell_phone_number}' #{customer.postal_code} #{customer.municipality}#{customer.address}#{customer.building} #{customer.hobby} #{customer.memo})
        csv << values
      end
    end
  end

  # カラムを指定してcsv出力
  def self.download_customers_csv_with_colmuns(customers, columns)
    CSV.generate do |csv|
      csv << columns #csvファイルのカラムを入れる

      # 選択したカラムからレコードを入れる処理
      customers.each do |customer|
        values = []
        columns.each do |column|
          value = customer[column]
          values << value
        end
        csv << values
      end
      # /選択したカラムからレコードを入れる処理
    end
  end

end