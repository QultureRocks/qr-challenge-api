# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      api! 'List all comments'
      param :user_id, Integer, desc: 'Id of the user', required: true
      description <<-HEREDOC
        This endpoint returns all comments made in a user
      HEREDOC
      example <<-HEREDOC
      {
        "comments": [
          {
            "id": 1,
            "value": "I hate Ryan!",
            "user_id": 1,
            "user": {
              "id": 1,
              "name": "A Ryan Seacrest Type",
              "email": "bettie@schummhammes.com",
              "photo_url": "https://vignette.wikia.nocookie.net/bojackhorseman/images/2/23/A_Ryan_Seacrest_Type.png/revision/latest?cb=20180320012608",
              "admission_date": "2014-08-22",
              "job_title": "Talk show Host",
              "created_at": "2018-11-13T18:40:35.248Z",
              "updated_at": "2018-11-13T18:40:35.248Z"
            }
          },
          {
            "id": 2,
            "value": "Beatrice is an awful horse",
            "user_id": 2,
            "user": {
              "id": 2,
              "name": "Beatrice Horseman",
              "email": "zachariah@terry.org",
              "photo_url": "https://vignette.wikia.nocookie.net/bojackhorseman/images/5/51/Old_Beatrice_Horseman_Season_4.png/revision/latest?cb=20171127015940",
              "admission_date": "2014-08-22",
              "job_title": "Houswewife",
              "created_at": "2018-11-13T18:40:35.198Z",
              "updated_at": "2018-11-13T18:40:35.198Z"
            }
          }
        ]
      }
      HEREDOC
      def index
        render json: comments
      end

      api! 'Shows a comment'
      description <<-HEREDOC
        This endpoint returns a comment information
      HEREDOC
      example <<-HEREDOC
        {
          "comment": {
            "id": 1,
            "value": "I hate Ryan!",
            "user_id": 1,
            "user": {
              "id": 1,
              "name": "A Ryan Seacrest Type",
              "email": "bettie@schummhammes.com",
              "photo_url": "https://vignette.wikia.nocookie.net/bojackhorseman/images/2/23/A_Ryan_Seacrest_Type.png/revision/latest?cb=20180320012608",
              "admission_date": "2014-08-22",
              "job_title": "Talk show Host",
              "created_at": "2018-11-13T18:40:35.248Z",
              "updated_at": "2018-11-13T18:40:35.248Z"
            }
          }
        }
      HEREDOC
      def show
        render json: comment
      end

      api! 'Deletes a comment'
      description <<-HEREDOC
        This endpoint deletes a comment
      HEREDOC
      param :id, Integer, desc: 'Id of the comment to be deleted', required: true
      def destroy
        if comment.destroy
          head :ok
        else
          render json: comment.errors
        end
      end

      api! 'Creates a comment'
      param :comment, Hash, desc: 'Comment JSON object', required: true do
        param :user_id, Integer, desc: 'Id of the user to comment', required: true
        param :value, String, desc: 'The actual comment', required: true
      end
      error 422, 'Unprocessable Entity - returned when comment data is incorrect', meta: { "status": '422', "error": 'Unprocessable Entity' }
      description <<-HEREDOC
        This endpoint creates a new comment based on the received data.
      HEREDOC
      example <<-HEREDOC
        Request

        {
          "comment": {
            "user_id": 3,
            "value": "Bojack is awesome!"
          }
        }

        Response

        {
          "comment": {
            "id": 3,
            "value": "Bojack is awesome!",
            "user_id": 3,
            "user": {
              "id": 3,
              "name": "Bojack",
              "email": "bojack@example.com.br",
              "job_title": 'Actor',
              "admission_date": '2015-11-01',
              "photo_url": 'https://imgur.com/gallery/something_about_bojack',
              "created_at": "2018-03-15T20:30:13.354-03:00",
              "updated_at": "2018-03-15T20:30:13.354-03:00"
            },
            "created_at": "2018-04-15T20:30:13.354-03:00",
            "updated_at": "2018-04-15T20:30:13.354-03:00"
          }
        }
      HEREDOC
      def create
        comment = Comment.new(comment_params)

        if comment.save
          render json: comment
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      api! 'Updates a comment'
      param :comment, Hash, desc: 'Comment JSON object', required: true do
        param :value, String, desc: 'The new comment', required: true
      end
      error 422, 'Unprocessable Entity - returned when user data is incorrect', meta: { "status": '422', "error": 'Unprocessable Entity' }
      description <<-HEREDOC
        This endpoint updates an user based on the received data.
      HEREDOC
      example <<-HEREDOC
        User before update

        {
          "comment": {
            "user_id": 3,
            "value": "Bojack is awesome!"
          }
        }

        Request

        {
          "comment": {
            "name": "Bojack is incredible!"
          }
        }

        Response

        {
          "comment": {
            "user_id": 3,
            "name": "Bojack is incredible!",
            "user": {
              "name": "Bojack new name",
              "email": "bojack@example.com.br",
              "job_title": 'Actor',
              "admission_date": '2015-11-01',
              "photo_url": 'https://imgur.com/gallery/something_about_bojack',
              "created_at": "2017-03-15T20:30:13.354-03:00",
              "updated_at": "2018-03-15T20:30:13.354-03:00"
            }
          }
        }
      HEREDOC
      def update
        if comment.update(comment_update_params)
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
        @comments ||= user&.comments || Comment.none
      end

      def comment
        @comment ||= Comment.find_by(id: params[:id])
      end

      def comment_params
        params.require(:comment).permit(:user_id, :value)
      end

      def comment_update_params
        params.require(:comment).permit(:value)
      end
    end
  end
end
