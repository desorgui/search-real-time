class Article < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_article_content, against: %i[title description],
    using: {tsearch: { prefix: true },trigram: {only: %i[title description],threshold: 0.25}}

    validates :title, presence: true, length: { minimum: 3, maximum: 200 }
    validates :description, presence: true, length: { minimum: 3 }
end
