class Team < ApplicationRecord
  has_many :users
  has_many :matters

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
