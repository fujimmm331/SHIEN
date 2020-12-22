class ContactLog < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :matter
end
