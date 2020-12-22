class Matter < ApplicationRecord
  belongs_to :team
  belongs_to :user

  with_options presence: true do
    validates :name, :sales_person, :municipality, :address
    validates :kana_sales_person, format:{ with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみ使用できます。"}
    validates :phone_number, :cell_phone_number, format:{ with:/\A\d{10,11}\z/, message: "は半角数字で入力してください。" }
    validates :postal_code, format:{ with:/\A\d{3}[-]\d{4}\z/, message: "はハイフンを含み、半角数字のみ使用できます。"}
  end
end
