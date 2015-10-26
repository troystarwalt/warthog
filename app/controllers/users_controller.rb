class UsersController < ApplicationController
  def signup
  end

  def login
  end

  def loginverify
    # > User(fname: string, password: string, ...)
    result = User.all.where(
      fname: params[:fname],
      password: params[:password]
    ).first

    if result
      #...
      session[:user_id] = result.id
      # redirect_to user_path result
      redirect_to "/profile"

    else
      redirect_to "/login?error=BADFNAMEORPASSWORD"
    end
  end

  def logout
    session[:user_id] = nil
    session.clear

    redirect_to "/users"

  end

  def profile
    @user = User.find_by(
      id: session[:user_id]
    )
  end

  # ===============

  def index
  	@users = User.all
  end

  def fact
  end

  def show
  	puts "Calling users#show with #{params[:id]}"
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	result = User.create(user_params)
  	if result
  		redirect_to user_path result
  	else
  		redirect_to "/user/new"
  	end
  	# redirect_to "/users"
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  	@zilch = User.find(params[:id])
  	@zilch.destroy
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(params[:user])
  	redirect_to user_path @user
  end

  def search
  end

  def searchresults
    @query = params[:fname]
    # TODO need to use ILIKE in Postgres, where strings are case sensitive
    @users = User.where("fname LIKE ?", "%#{params[:fname]}%")
  end

  def view_helpers
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password, :fact, :password_confirmation)
  end
end
