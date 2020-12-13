class Team < ApplicationRecord
  has_many :team_matters
  has_many :users
  has_many :matters, through: :team_matters

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
