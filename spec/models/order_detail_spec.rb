require "rails_helper"
require "support/shared_examples/index_examples.rb"

RSpec.describe OrderDetail, type: :model do
  describe "associations" do
    it {should belong_to(:order)}
    it {should belong_to(:product)}
  end

  describe "scope" do
    let!(:order_detail) {FactoryBot.create(:order_detail)}
    it "created this week" do
      expect(OrderDetail.this_week).to eq ([order_detail])
    end
  end

  describe "check private method" do
    describe "#change_product_quantity" do
      let!(:product) {FactoryBot.create(:product, residual: 20)}
      let!(:order_detail) {FactoryBot.create(:order_detail, product: product, quantity: 10)}
      it "decreases the product residual by the order detail quantity" do
        expect(product.residual).to eq (10)
      end
    end
  end
end
