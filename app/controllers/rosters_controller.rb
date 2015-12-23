class RostersController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :view, :update]
  before_action :check_roster_exists, only: [:create]
  before_action :check_roster_exists_update, only: [:update]


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

   def check_roster_exists
    @roster = Roster.where(:begin_date => params[:roster][:begin_date], :employee_id => params[:roster][:employee_id])
    @holiday = Holiday.where("start_date <= ?", params[:roster][:begin_date]).where("finish_date >= ?", params[:roster][:begin_date]).where(:employee_id => params[:roster][:employee_id])
    if !@roster.blank?
      redirect_to (:back) 
      flash[:danger] = "Already Working This Day!"
    end
    if !@holiday.blank?
      redirect_to (:back) 
      flash[:danger] = "Employee is on Holiday!"
    end
  end

  def check_roster_exists_update
    @stored_roster = Roster.find(params[:id])
    if @stored_roster.begin_date.to_s != (params[:roster][:begin_date]) #updating roster for differnt day Check not working on new day.
      @roster = Roster.where(:begin_date => params[:roster][:begin_date], :employee_id => params[:roster][:employee_id])
      if !@roster.blank?
        redirect_to (:back) 
        flash[:danger] = "Already Working This Day!"
      end
    else #updating roster for same day Check shift id.
      @roster = Roster.where(:begin_date => params[:roster][:begin_date], :employee_id => params[:roster][:employee_id], :shift_id => params[:roster][:shift_id])
      if !@roster.blank?
        redirect_to (:back) 
        flash[:danger] = "Already Working This Shift!"
      end
    end
    @holiday = Holiday.where("start_date <= ?", params[:roster][:begin_date]).where("finish_date >= ?", params[:roster][:begin_date]).where(:employee_id => params[:roster][:employee_id])
    if !@holiday.blank?
      redirect_to (:back) 
      flash[:danger] = "Employee is on Holiday!"
    end
  end

     
         def destroy
             @roster = Roster.find(params[:id])
          if @roster.present?
             @roster.destroy
          end
              redirect_to :action => 'index'#root_url
          end
          


      end