class Movie < ApplicationRecord

    belongs_to :checked_out_to, class_name: "User", optional: true
    validates :title, presence: true

    scope :sorted, lambda { order("movies.title ASC")}
    scope :sort_by_added, lambda { order("movies.created_at DESC")}
end
