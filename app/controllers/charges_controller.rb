class ChargesController < ApplicationController
  def new; end

  def create
    success = UpgradeUser.call(stripeEmail: params[:stripeEmail], stripeToken: params[:stripeToken], user_id: params[:user_id])

    if success
      redirect_to edit_user_artist_detail_path(user_id: params[:user_id], is_pro: 'true')
    end
  end

end
