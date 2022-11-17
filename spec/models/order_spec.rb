require "rails_helper"
require "support/shared_examples/index_examples.rb"

RSpec.describe Order, type: :model do
  describe "associations" do
    it {should belong_to(:user)}
    it {should have_many(:order_details).dependent(:destroy)}
    it {should have_many(:products).through(:order_details)}
  end

  describe "enums" do
    it {should define_enum_for(:status)}
  end

  describe "scope" do
    let!(:order) {FactoryBot.create(:order)}
    it "created this week" do
      expect(Order.this_week).to eq ([order])
    end
  end

  describe "method" do
    describe ".search" do
      let(:user_1) {FactoryBot.create(:user, name: "aasdasdasda")}
      let(:user_2) {FactoryBot.create(:user, name: "xxxxxxxx")}
      let(:order_1) {FactoryBot.create(:order, user: user_1)}
      let(:order_2) {FactoryBot.create(:order, user: user_1)}
      let(:order_3) {FactoryBot.create(:order, user: user_2)}
      let(:order_4) {FactoryBot.create(:order, user: user_2)}
  
      it "should find to orders" do
        keyword = "a"
        order_user = Order.joins(:user).search keyword
        expect(order_user).to eq [order_1, order_2]
      end
  
      it "should not find to orders" do
        keyword = "o"
        order_user = Order.joins(:user).search keyword
        expect(order_user).to eq []
      end
    end
  end
end
