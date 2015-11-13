class HolidaysController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy, :view, :update]
      def create
      end

      def destroy
      end

      def update
      end

      def view
      end
    end