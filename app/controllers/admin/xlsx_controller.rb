class Admin::XlsxController < Admin::BaseController
  def index
    @orders = Order.this_week.group(:user_id).includes(:users).count
    @order_details = OrderDetail.this_week.group(:product_id).includes(:products).count
    respond_to do |format|
      format.html
      format.xlsx do
        response.headers["Content-Disposition"] = 
        'attachament; filename="Weekly_report.xlsx"'
      end
    end
  end
end