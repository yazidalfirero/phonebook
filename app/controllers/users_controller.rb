class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(created_at: :desc)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
        if @user.save
          format.html { redirect_to users_url, notice: "User was successfully created."}
          format.json { render :show, status: :created, location: users_url }
          format.js
        else
          format.html { render :new, status: :unprocessable_entity} 
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.js
        end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice:"User was successfully updated." }
        format.json { render :show, status: :ok, location: @user } 
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity } 
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js
      end 
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully deleted." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def current_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end

end
