class ShiftsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :view, :update]


      def new
      @shift = Shift.new
      end

      def index
        @shifts = current_user.shifts
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


      def edit
       @shift = Shift.find(params[:id])
      
      end

     def update
        @shift = Shift.find(params[:id])
  
        if @shift.update_attributes(shift_param)
        redirect_to :action => 'index'  
      else
        @shifts = shift.all
        render :action => 'edit'
      end
   
      end





   def shift_param
    params.require(:shift).permit(:start_time, :finish_time, :total_hours)
   end





      def destroy
             @shift = Shift.find(params[:id])
          if @shift.present?
             @shift.destroy
          end
              redirect_to root_url
          end


      def view
      end

    
    end