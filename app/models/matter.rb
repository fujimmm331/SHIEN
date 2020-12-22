class Matter < ApplicationRecord
  has_many :contact_logs
  belongs_to :team
  belongs_to :user

  with_options presence: true do
    validates :name, :sales_person, :municipality, :address
    validates :kana_sales_person, format:{ with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみ使用できます"}
    validates :phone_number, :cell_phone_number, format:{ with:/\A\d{10,11}\z/, message: "は半角数字・11桁以内でお願いします" }
    validates :postal_code, format:{ with:/\A\d{7}\z/, message: "は半角数字・7桁以内でお願いします"}
  end
end
