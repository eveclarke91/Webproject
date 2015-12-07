class RostersController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :view, :update]

      def new
        @roster = Roster.new
      end

      def index
        @rosters = Roster.all
       end

      def create
        secure_params = params.require(:roster).permit(:begin_date, :employee_id, :start_time, :finish_time)

        
        @roster = current_user.rosters.build(secure_params)
        
        if ( Employee.find(params[:roster][:employee_id]) and
             Shift.find(params[:roster][:shift_id]) and
            @roster.save )
            
          #flash[:success] = "Your Holiday has been created sucessfully"  
    

          redirect_to action: 'index', notice: 'Roster was successfully created.'
          #redirect_to @user
          #redirect_to root_url
           # Handle a successful save.
        else
            render action: "new"     
      end
    end
  


      def destroy
      end

      def view
      end

      def update
      end
    end
