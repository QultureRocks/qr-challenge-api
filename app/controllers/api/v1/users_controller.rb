# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      api! 'List all users'
      description <<-HEREDOC
        This endpoint returns all users in the database
      HEREDOC
      example <<-HEREDOC
      {
        "users": [
          {
            "id": 1,
            "name": "A Ryan Seacrest Type",
            "email": "bettie@schummhammes.com",
            "photo_url": "https://vignette.wikia.nocookie.net/bojackhorseman/images/2/23/A_Ryan_Seacrest_Type.png/revision/latest?cb=20180320012608",
            "admission_date": "2014-08-22",
            "job_title": "Talk show Host",
            "created_at": "2018-11-13T18:40:35.248Z",
            "updated_at": "2018-11-13T18:40:35.248Z"
          },
          {
            "id": 2,
            "name": "Beatrice Horseman",
            "email": "zachariah@terry.org",
            "photo_url": "https://vignette.wikia.nocookie.net/bojackhorseman/images/5/51/Old_Beatrice_Horseman_Season_4.png/revision/latest?cb=20171127015940",
            "admission_date": "2014-08-22",
            "job_title": "Houswewife",
            "created_at": "2018-11-13T18:40:35.198Z",
            "updated_at": "2018-11-13T18:40:35.198Z"
          }
        ]
      }
      HEREDOC
      def index
        render json: users
      end

      api! 'Shows an users'
      description <<-HEREDOC
        This endpoint returns an user information
      HEREDOC
      example <<-HEREDOC
        {
          "user": {
            "id": 1,
            "name": "BoJack Horseman",
            "email": "bunnystehr@bosco.net",
            "photo_url": "https://vignette.wikia.nocookie.net/bojackhorseman/images/d/d2/BoJack_Horsemann.png/revision/latest?cb=20170924222700",
            "admission_date": "2014-08-22",
            "job_title": "Actor",
            "created_at": "2018-11-13T18:40:35.108Z",
            "updated_at": "2018-11-13T18:40:35.108Z"
          }
        }
      HEREDOC
      def show
        render json: user
      end

      api! 'Deletes an user'
      description <<-HEREDOC
        This endpoint deletes an user
      HEREDOC
      param :id, String, desc: 'Id of the user to be deleted', required: true
      def destroy
        if user.destroy
          head :ok
        else
          render json: user.errors
        end
      end

      api! 'Creates an user'
      param :user, Hash, desc: 'User JSON object', required: true do
        param :name, String, desc: 'User name', required: true
        param :email, String, desc: 'User email', required: true
        param :job_title, String, desc: 'User job title / occupation', required: true
        param :admission_date, String, desc: 'Date when user entered the company', required: true
        param :photo_url, String, desc: 'URL with an image'
      end
      error 422, 'Unprocessable Entity - returned when user data is incorrect', meta: { "status": '422', "error": 'Unprocessable Entity' }
      description <<-HEREDOC
        This endpoint creeates a new user based on the received data.
      HEREDOC
      example <<-HEREDOC
        Request

        {
          "user": {
            "name": "Bojack",
            "email": "bojack@example.com.br",
            "job_title": 'Actor',
            "admission_date": '2015-11-01',
            "photo_url": 'https://imgur.com/gallery/something_about_bojack'
          }
        }

        Response

        {
          "user": {
            "id": 3,
            "name": "Bojack",
            "email": "bojack@example.com.br",
            "job_title": 'Actor',
            "admission_date": '2015-11-01',
            "photo_url": 'https://imgur.com/gallery/something_about_bojack',
            "created_at": "2018-03-15T20:30:13.354-03:00",
            "updated_at": "2018-03-15T20:30:13.354-03:00"
          }
        }
      HEREDOC
      def create
        user = User.new(user_params)

        if user.save
          render json: user
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      api! 'Updates an user'
      param :user, Hash, desc: 'User JSON object', required: true do
        param :name, String, desc: 'User name'
        param :email, String, desc: 'User email'
        param :job_title, String, desc: 'User job title / occupation'
        param :admission_date, String, desc: 'Date when user entered the company'
        param :photo_url, String, desc: 'URL with an image'
      end
      error 422, 'Unprocessable Entity - returned when user data is incorrect', meta: { "status": '422', "error": 'Unprocessable Entity' }
      description <<-HEREDOC
        This endpoint updates an user based on the received data.
      HEREDOC
      example <<-HEREDOC
        User before update

        {
          "user": {
            "name": "Bojack",
            "email": "bojack@example.com.br",
            "job_title": 'Actor',
            "admission_date": '2015-11-01',
            "photo_url": 'https://imgur.com/gallery/something_about_bojack'
          }
        }

        Request

        {
          "user": {
            "name": "Bojack new name"
          }
        }

        Response

        {
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
      HEREDOC
      def update
        if user.update(user_params)
          render json: user
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      private

      def users
        @users ||= User.order_by_name
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
