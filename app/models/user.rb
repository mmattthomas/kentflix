class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :team, optional:true

  attribute :team_name, :string
  attribute :team_short_name, :string
  attribute :team_checkout_limit, :integer

  def self.for_team(team_id)
		where("team_id = ?", team_id)
	end
end
