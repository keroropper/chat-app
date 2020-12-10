class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params) #もしユーザー情報の更新ができたら、root_pathヘリダイレクトする
      redirect_to root_path
    else #上記以外であれば、ユーザー情報更新ページを表示する。(ユーザー入力情報はそのまま)
      render :edit
    end
  end


  private

  def user_params #ユーザーの情報  :user → name,email
    params.require(:user).permit(:name, :email) 
  end

end
