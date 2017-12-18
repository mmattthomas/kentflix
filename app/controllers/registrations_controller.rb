class RegistrationsController < Devise::RegistrationsController

  def new
    super
    # @user = User.new
    # @user.team_name = "Enter Team Name To Join or Create Here"
    # @resource = @user
    # @resource_name = "User"
  end

  def create
    super do |resource|
      handle_team(resource)
      flash[:notice] = "You are now an admin"
    end
  end

  def update
    super
  end

  private

  def handle_team(new_user)
    # check if team name exists - if yes, then join, if not, then create
    team = Team.find_by name: new_user.team_name
    if team.nil?
      #not found, create
      new_team = Team.new
      new_team.name = new_user.team_name
      new_team.save!

      new_user.team_id = new_team.id
      new_user.admin = true
      new_user.save!
      puts "Created new team: #{new_user.team_name}"
      Rails.logger.debug "Created new team: #{new_user.team_name}"
    else
      #found - set team id
      new_user.team_id = team.id
      new_user.save!
      puts "Joined team: #{new_user.team_name}"
      Rails.logger.debug "Joined team: #{new_user.team_name}"
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :team, :team_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    #... maybe don't permit team?
    params.require(:user).permit(:name, :team, :email, :password, :password_confirmation, :current_password)
  end
end