class UsersController < ApplicationController
  include JwtAuthenticationConcern
  # before_action :set_user, only: [:show, :update, :destroy]

  def login
    errors = ['Invalid email address/password combination.']
    user = fetch_user
    return render status: :bad_request, json: { errors: errors } if user.blank?
    if user.authenticate(params[:password])
      render status: :ok, json: { value: create_token(user) }
    else
      render status: :bad_request, json: { errors: errors }
    end
  end

  def fetch_user
    User.find_by_email(params['email'])
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new({
      email: params["user"]["email"],
      password: params["user"]["password"]
    })

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require("user").permit("email", "password")
    end
end
