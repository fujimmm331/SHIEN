class Notification < ApplicationRecord
  belongs_to :matter
  belongs_to :contact_log
  belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id'
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id'

end