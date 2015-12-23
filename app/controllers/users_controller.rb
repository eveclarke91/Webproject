class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @employees = @user.employees
    @feed_items = Roster.where(:begin_date => Time.now.strftime("%Y-%m-%d"), :user_id => current_user.id)
    #@wage_items = Roster.joins(:roster,:shift).joins(:roster,:employee).select("*")
    #SELECT name, rate_of_pay, SUM(total_hours) , SUM(total_hours * rate_of_pay) FROM rosters INNER JOIN employees ON rosters.employee_id = employees.id INNER JOIN shifts ON rosters.shift_id = shifts.id WHERE begin_date > (SELECT DATETIME ('now', '-7 day')) GROUP BY employee_id
    #@shift = @user.shifts
  end
      
  def new
  	 @user = User.new
  end

  def create
      secure_params = params.require(:user).permit(:name, :email,:password, :password_confirmation)
      @user = User.new(secure_params)
      if @user.save
        remember @user       #  NEW LINE
      	flash[:success] = "Welcome to the Work Roster App!"
      	redirect_to @user
         # Handle a successful save.
      else
          render 'new'    
      end
    end

    
  end
