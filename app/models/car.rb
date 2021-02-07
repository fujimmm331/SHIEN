class Car < ApplicationRecord
  belongs_to :customer

  validates :vehicle_number, format:{ with:/\A[a-zA-Z0-9]+\z/, message: "は半角英数字のみ使用できます"}
  validates :transport_bureau, :registration_number, length: { maximum: 4 }, message: "は4文字以内で入力してください"
  validates :class_number, length: { maximum: 3 }, message: "は3文字以内で入力してください"
  validates :class_number, :registration_number, :vehicle_inspection_day, :registered_year, numericality: { only_integer: true }, message: "は半角数字のみ使用できます"
  validates :registration_type, length: { maximum: 1 }, message: "はひらがな1文字で入力してください"
  validates :registration_type, format: { /\A[ぁ-んー－]+\z/ }, message: "はひらがな1文字で入力してください"
  validates :vehicle_inspection_day, :registered_year, length:{ maximum: 12 }, messages: "は12文字以内で入力してください"
end
