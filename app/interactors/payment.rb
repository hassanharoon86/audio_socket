class Payment
  include Interactor

  def call
    byebug
    stripeEmail = context.stripeEmail
    stripeToken = context.stripeToken

    @amount = ArtistDetail::CHARGES_IN_CENTS

    customer = Stripe::Customer.create(
      email: stripeEmail,
      source: stripeToken
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
