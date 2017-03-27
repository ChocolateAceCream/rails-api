class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :create]
  wrap_parameters :user, include: [:email,  :password, :password_confirmation, :name,:id]

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
    user = User.new(user_params)
    if user.save

        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
            render json: { auth_token: command.result}
        else
            render json: { errors: command.errors[:authentication_error] }, status: :unauthorized
        end
    else
      render json: user.errors, status: :unprocessable_entity
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
    def set_User
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email,  :password, :password_confirmation, :name,:id)
    end
end
