class UsersController < ApplicationController


  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render 'welcome'
    else
      render 'new'
    end
  end

  def welcome
  end

  def edit
    @detail = User.find_by(id: session[:user_id]).user_detail ? User.find_by(id: session[:user_id]).user_detail : User.find_by(id: session[:user_id]).user_detail
  end

  def update
    @detail = User.find_by(id: session[:user_id]).user_detail ? User.find_by(id: session[:user_id]).user_detail : User.find_by(id: session[:user_id]).user_detail
    # params[:user][:avatar].present? ? session[:user_id].size = params[:user][:avatar].size : @user.size = 0
    debugger
    @user.avatar = params[:user][:avatar]
    if @user.update(user_params)
      flash[:notice] = "#{@user.firstname} Your Profile successfully updated"
      redirect_to user_dashboards_path(user_id: @user.id) #VK : Redirect from here to dashboard and show message. remove "show_update" action. done
    else
      render 'edit'
      # redirect_to edit_user_path
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :gender, :dob, user_detail_attributes: [:address, :city, :pincode, :phone] )
    end

end
