 class EmployeesController < ApplicationController
     before_action :logged_in_user, only: [:create, :destroy, :view, :update]

      def new
        @employee = Employee.new
      end


        def index
        @employees = Employee.all
        end

      


      def create
        secure_params = params.require(:employee).permit(:name, :address, :number, :rate_of_pay)

        #@employee = current_user.employees.build(secure_params)
        @employee = current_user.employees.build(secure_params)
        #@employee = Employee.new(secure_params)

        if @employee.save
           #remember @employee       #  NEW LINE
          flash[:success] = "Your employee has been created sucessfully"  
    

          redirect_to action: 'index', notice: 'Employee was successfully created.'
        	#redirect_to @user
          #redirect_to root_url
           # Handle a successful save.
        else
            render action: "new"     
      end
    end 

  

#def create
    #secure_params = params.require(:film).                                         
                 #     permit(:name, :description, :duration,:genre_id,:director_id,:threeD)
   # @film = Film.new(secure_params)
   # if ( Director.find(params[:film][:director_id]) and   
         #Genre.find(params[:film][:genre_id]) and 
      #  #    @film.save )
      #  redirect_to action: 'index', notice: 'Film was successfully created.'
   # else
      #  render action: "new" 
   # end
  #end
        

      #def show
        #@employee = Employee.find(params[:id])
      
      #end

      def destroy
      end

      def view
      end

      def update
      end
    end