class RostersController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :view, :update]

      def new
        @roster = Roster.new
      end

      def index
        @rosters = current_user.rosters
       end

      def create
        secure_params = params.require(:roster).permit(:begin_date, :employee_id, :shift_id)

        
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

       def edit
       @roster= Roster.find(params[:id])
       
      end

    def update
        @roster = Roster.find(params[:id])
  
        if @roster.update_attributes(roster_param)
        redirect_to :action => 'index'  
      else
        @rosters = roster.all
        render :action => 'edit'
      end
   
      end


   def roster_param
    params.require(:roster).permit(:begin_date, :employee_id, :shift_id)
   end



     
         def destroy
             @roster = Roster.find(params[:id])
          if @roster.present?
             @roster.destroy
          end
              redirect_to root_url
          end
          


      end