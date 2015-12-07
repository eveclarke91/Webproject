class HolidaysController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy, :view, :update]

      def new
        @holiday = Holiday.new
      end

      def index
        @holidays = Holiday.all
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



      def destroy
      end

      def update
      end

      def view
      end
    end