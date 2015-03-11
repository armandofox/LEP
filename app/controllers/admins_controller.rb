class AdminsController < ApplicationController

  before_filter :check_admin

  def check_admin
    @user = User.find(params[:id])
    unless session[:id] == @user.id and @user.admin
      redirect_to user_path
    end
  end

  def new
  end

  def create
    @auth = request.env['omniauth.auth']['credentials']
    @email = request.env['omniauth.auth']['info']['email']
    #@user = User.create(params[:user])
    #redirect_to users_path #redirect to show action
  end

  def index
    @users = User.where(!:admin) # want to list all non-admin users
    @groups = Group.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to admin_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_path
  end

end
