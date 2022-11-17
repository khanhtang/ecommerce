class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.week_summary.subject
  #
  def week_summary
    @greeting = "Hi"
    @orders = Order.this_week.group(:user_id).includes(:users).count
    @order_details = OrderDetail.this_week.group(:product_id).includes(:products).count

    mail to: "a2suisei0@gmail.com", subject: t("admin.week_summary")
  end
end
