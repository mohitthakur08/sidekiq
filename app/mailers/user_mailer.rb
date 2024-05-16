class UserMailer < ApplicationMailer
    def user_creation_notification
        byebug
      @user = params[:user]
      mail(to: @user.email, subject: "Welcome to Our Application!")

    end
end