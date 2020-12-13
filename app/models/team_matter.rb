class TeamMatter < ApplicationRecord
  belongs_to :matter
  belongs_to :team
end
