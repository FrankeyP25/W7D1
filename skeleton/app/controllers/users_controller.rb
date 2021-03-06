class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to cats_url
        else
            reden json: @user.erros.full_messages, status: 422
        end
    end

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end