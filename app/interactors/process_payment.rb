class ProcessPayment
  include Interactor

  def call
    byebug

    customer = Stripe::Customer.create(
      email: context.stripeEmail,
      source: context.stripeToken
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: ArtistDetail::CHARGES_IN_CENTS,
      currency: :usd
    )

  rescue Stripe::CardError => e
    redirect_to new_charge_path, alert: e.message
  end
end
