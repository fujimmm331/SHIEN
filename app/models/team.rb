class Team < ApplicationRecord
  has_many :users
  has_many :customers
  has_many :contact_logs

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
