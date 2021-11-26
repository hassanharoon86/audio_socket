class ChargesController < ApplicationController
  def new; end

  def create
    @amount = ArtistDetail::CHARGES_IN_CENTS

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

  redirect_to edit_user_artist_detail_path(user_id: params[:user_id], is_pro: 'true')

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
