class Movie < ApplicationRecord

    belongs_to :checked_out_to, class_name: "User"
    validates :title, presence: true

end
