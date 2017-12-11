class Movie < ApplicationRecord

    has_many :comments
    belongs_to :checked_out_to, class_name: "User", optional: true
    validates :title, presence: true

    scope :sorted, lambda { order("movies.title ASC")}
    scope :sort_by_added, lambda { order("movies.created_at DESC")}

    def self.checkout_count_for_user user_id
        self.where("checked_out_to_id = ?", user_id).count
    end
end
