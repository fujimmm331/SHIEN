class Matter < ApplicationRecord
  has_many :team_matters
  has_many :teams, through: :team_matters
end
