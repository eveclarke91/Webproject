class HolidaysController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy, :view, :update]

      def new
        @holiday = Holiday.new
      end

      def index
        @holidays = current_user.holidays
       end

      def create
        secure_params = params.require(:holiday).permit(:employee_id, :start_date, :finish_date)

        
        @holiday = current_user.holidays.build(secure_params)
        
        if ( Employee.find(params[:holiday][:employee_id]) and   
            @holiday.save )
            
          flash[:success] = "Your Holiday has been created sucessfully"  
    

         redirect_to action: 'index', notice: 'Holiday was successfully created.'
        	#redirect_to @user
          #redirect_to root_url
           # Handle a successful save.
        else
            render action: "new"     
      end
    end

      def edit
       @holiday = Holiday.find(params[:id])
       
      end


      def destroy
             @holiday = Holiday.find(params[:id])
          if @holiday.present?
             @holiday.destroy
          end
              redirect_to :action => 'index'#root_url
          end


      def update
        @holiday = Holiday.find(params[:id])
  
        if @holiday.update_attributes(holiday_param)
        redirect_to :action => 'index'  
      else
        @holidays = holiday.all
        render :action => 'edit'
      end
   
      end


      def holiday_param
     params.require(:holiday).permit(:employee_id, :start_date, :finish_date)
     end

      def view
      end
    end