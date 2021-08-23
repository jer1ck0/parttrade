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
        respond_to do |format|
            if @user.save 
                format.html { redirect_to :controller => "users", :action => "new", notice: 'User was successfully created' }
                format.js 
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
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
