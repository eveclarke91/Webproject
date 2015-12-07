class VaccationsController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy, :view, :update]

      def new
        @vaccation = Vaccation.new
      end

      def index
        @Vaccations = Vaccation.all
       end

      def create
        secure_params = params.require(:vaccation).permit(:employee_id, :start_date, :finish_date)

        
        @vaccation = current_user.vaccations.build(secure_params)
        
        if ( Employee.find(params[:vaccation][:employee_id]) and   
            @vaccation.save )
            
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