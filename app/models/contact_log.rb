class ContactLog < ApplicationRecord
  has_many :notifications, dependent: :destroy
  belongs_to :team
  belongs_to :user
  belongs_to :matter

  validates :comment, presence: true
end
