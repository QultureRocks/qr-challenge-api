
module Api
  module V1
    class CommentsController < ApplicationController
      def index
        render json: comments
      end

      def show
        render json: comment
      end

      def destroy
        if comment.destroy
          head :ok
        else
          render json: comment.errors
        end
      end

      def create
        comment = Comment.new(comment_params)

        if comment.save
          render json: comment
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if comment.update(comment_params)
          render json: comment
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      private

      def user
        @user ||= User.find_by(id: params[:user_id])
      end

      def comments
        @comment ||= user&.comments || Comment.none
      end

      def comment
        @comment ||= Comment.find_by(id: params[:id])
      end

      def comment_params
        params.require(:comment).permit(:user_id, :value)
      end
    end
  end
end