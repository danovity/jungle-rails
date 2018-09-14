class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def welcome_email(order, orders)
    binding.pry
    @detail = order
    @order = orders
    @url = "http://example.com/login"
    mail(to: @detail.email, subject: "Thank you for your order.")
  end
end
