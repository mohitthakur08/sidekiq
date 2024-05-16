# app/controllers/users_controller.rb
class UsersController < ApplicationController
    def new
        @user = User.new  
    end

    def create
      @user = User.new(user_params)
  
      if @user.save
        byebug
        send_user_creation_notification(@user)
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  
    def send_user_creation_notification(user)
        byebug
      UserMailer.with(user: user).user_creation_notification.deliver_now
      puts "Notification sent: User #{user.name} created with email #{user.email}"
    end
  end
  