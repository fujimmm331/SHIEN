class Team < ApplicationRecord
  has_many :team_users
  has_many :team_matters
  has_many :users, through: :team_users
  has_many :matters, through: :team_matters

  validates :name, presence: true
end
