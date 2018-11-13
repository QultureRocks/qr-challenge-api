
module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: users
      end

      def show
        render json: user
      end

      def destroy
        if user.destroy
          head :ok
        else
          render json: user.errors
        end
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def update
        if user.update(user_params)
          render json: user
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      private

      def users
        @user ||= User.order_by_name
      end

      def user
        @user ||= User.find_by(id: params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :job_title, :admission_date, :photo_url)
      end
    end
  end
end