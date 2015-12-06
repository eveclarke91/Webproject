class UsersController < ApplicationController

      def show
        @user = User.find(params[:id])
        @employee = @user.employees
      end
      
  def new
  	 @user = User.new
  end

  def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
          remember @user       #  NEW LINE
          flash[:success] = "Welcome to the Sample App!"  
        	flash[:success] = "Welcome to the Twitter App!"
        	redirect_to @user
           # Handle a successful save.
        else
            render 'new'     
        end
      end
  end
