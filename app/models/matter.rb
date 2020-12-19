class Matter < ApplicationRecord
  belongs_to :team
  belongs_to :user

  with_options presence: true do
    validates :name, :sales_person, :municipality, :address
    validates :kana_sales_person, format:{ with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :phone_number, :cell_phone_number, format:{ with:/\A\d{10,11}\z/, message: "can use only half-width numbers." }
    validates :postal_code, format:{ with:/\A\d{3}[-]\d{4}\z/, message: "should include hyphen, and can use only half-width numbers."}
  end
end
