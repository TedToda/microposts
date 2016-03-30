class UsersController < ApplicationController
  
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  #def edit
   # @session_id = session[:user_id]
	#if current_user == @user
	#	if @user.update(user_params)
  #	flash[:success] = “updated”
   # redirect_to root_path
    #else
    #flash.now[:alert] = “false”
    #render ‘edit’
    #end
  #end
   # else
    #flash[:danger] = “login as a correct user”
    #redirect_to login_url
    #end
  #end


  def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'updated'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end