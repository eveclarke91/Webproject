class ShiftsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :view, :update]


      def new
      @shift = Shift.new
      end

      def index
        @shifts = Shift.all
        end


      def create
        secure_params = params.require(:shift).permit(:start_time, :finish_time, 
                                  :total_hours)
      #@shift = Shifts.new(secure_params)
       @shift = current_user.shifts.build(secure_params)
      if @shift.save
       #remember @shift      #  NEW LINE
       flash[:success] = "Your Shift has been created sucessfully"  
    
        redirect_to root_url
        # Handle a successful save.
        else
            render 'new'     
        end
      end


      def destroy
      end

      def view
      end

      def update
      end
    end