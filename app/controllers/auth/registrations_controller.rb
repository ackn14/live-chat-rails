class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private
  # HTTPリクエストに付与されているパラメータでどれを許可するか指定する
  # 意図しないデータの登録や更新を防ぐことができる
  def sign_up_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
