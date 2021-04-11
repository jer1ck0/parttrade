class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to :controller => "users", :action => "new"
        else
            redirect_to :action => "index", notice: "Your user no send"
        end
    end

    def edit
    end

    def update

    end

    def destroy
        @user.destroy
        redirect_to :action => "index"
    end

    private

    def user_params
        params.require(:user).permit(:phone, :firstname, :secondname, :email, :adress, :comment)
    end

    def set_user
        @user = User.find(params[:id])
    end

end
