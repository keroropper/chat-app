class ApplicationController < ActionController::Base
  before_action :authenticate_user! #ログイン状態によってログイン状態によって表示するページを切り替える
  before_action :configure_permitted_parameters, if: :devise_controller?#まずnameを取得。
  #:もしdeviseに関するコントローラーの処理であれば、そのときだけconfigure_permitted_parametersメソッドを実行するように設定しています。
end







  private
  def configure_permitted_parameters #メソッド名は慣習
    # deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #(:deviseの処理名, keys: [:許可するキー])
  end
