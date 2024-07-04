class FulfillmentsController < ApplicationController
  def show
    session = Stripe::Checkout::Session.retrieve({ id: params[:session_id] })

    course = Course.find(session.metadata.course_id)
    current_user.purchased_courses.create(course: course)

    redirect_to courses_url, notice: "Thanks for purchasing #{course.title}!"
  rescue Stripe::InvalidRequestError => e
    redirect_to root_url, alert: "Sorry, we could not process your payment: #{e.message}"
  end
end
