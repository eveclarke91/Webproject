 class EmployeesController < ApplicationController

      def create
        secure_params = params.require(:employee).permit(:name, :address, 
                                  :number, :rate_of_pay)
        @employee = Employee.new(secure_params)
        if @employee.save
          remember @employee       #  NEW LINE
          flash[:success] = "Your employee has been created sucessfully"  
    
        	#redirect_to root_url
           # Handle a successful save.
        else
            render 'new'     
        end

      def new
  	  @employee = Employee.new
      end

      def destroy
      end

      def view
      end

      def update
      end
    end
    end