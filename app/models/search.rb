# Search model
class Search < ApplicationRecord
  validates :search_query, presence: true, length: { minimum: 3, maximum: 100 }
  validates :user_ip, presence: true, length: { minimum: 7, maximum: 15 }
  validates :search_query, :user_ip, format: { with: /\A[a-zA-Z0-9. ]+\z/ }
end
