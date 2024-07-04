class PaymentsController < ApplicationController
  before_action :set_course

  def new
    set_checkout_session
  rescue Pay::Error => e
    flash[:alert] = e.message
    redirect_to root_url
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_checkout_session
    payment_processor = current_user.set_payment_processor(:stripe)

    args = {
      allow_promotion_codes: true,
      automatic_tax: { enabled: true },
      consent_collection: { terms_of_service: :required },
      customer_update: { address: :auto },
      mode: :payment,
      ui_mode: :embedded,
      line_items: [ {
        price: @course.stripe_price,
        quantity: 1
      } ],
      metadata: {
        course_id: @course.id
      },
      return_url: fulfillment_url
    }

    @checkout_session = payment_processor.checkout(**args)
  end
end
