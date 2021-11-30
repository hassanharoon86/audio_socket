# frozen_string_literal: true

class ChargesController < ApplicationController
  def new; end

  def create
    result = ProcessPayment.call(stripeEmail: params[:stripeEmail], stripeToken: params[:stripeToken],
                                 user_id: params[:user_id])
    return unless result.success?

    @artist_detail = current_user.artist_detail
    @artist_detail.update(is_pro: true)
    redirect_to edit_user_artist_detail_path(user_id: params[:user_id]), notice: "You're now a pro user"
  end
end
