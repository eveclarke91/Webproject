 class EmployeesController < ApplicationController
     before_action :logged_in_user, only: [:create, :destroy, :view, :update]
     before_action :correct_user,   only: :destroy  # NEW LINE

      def new
        @employee = Employee.new
      end


        def index
        @employees = current_user.employees
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

  


      def show
        @employee = Employee.find(params[:id])
      
      end

      def edit
       @employee = Employee.find(params[:id])
       #@employees = Employees.all
      end

      #ef update
     #@employee = Employee.find(params[:id])
     #f @employee.update_attributes(employee_params)
      # Handle a successful update.
     #else
      #render 'edit'
    #end
  #end

      def update
        @employee = Employee.find(params[:id])
  
        if @employee.update_attributes(employee_param)
        redirect_to :action => 'index'  #:id => @employee
      else
        @employees = employee.all
        render :action => 'edit'
      end
   
      end





   def employee_param
    params.require(:employee).permit(:name, :address, :number, :rate_of_pay)
   end

       def destroy
            @employee.destroy
            redirect_to root_url
          end

           
      private

            def correct_user
              @employee = current_user.employees.find_by(id: params[:id])
              redirect_to root_url if @employee.nil?
            end

 private

    def employee_params
      params.require(:employee).permit(:name, :address, :number, :rate_of_pay)
    end
      


      def view
      end

      
    end