require "rails_helper"
require "shoulda/matchers"

RSpec.describe Product, type: :model do
  context "Validations:" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_numericality_of(:price) }
  end

  before :each do
    @category = Category.create!(
      name: "Men",
    )

    @product = Product.new(
      name: "Tooth brush",
      price: 12,
      quantity: 5,
      category: @category,
    )
  end

  it "product saved is true" do
    expect(@product.save()).to eql(true)
  end

  it "is not valid without a name" do
    @product.name = nil
    expect(@product.save()).to eql(false)
    expect(@product).to_not be_valid
  end

  it "is not valid without a price" do
    @product.price_cents = nil
    expect(@product.save()).to eql(false)
    expect(@product).to_not be_valid
  end

  it "is not valid without a quantity" do
    @product.quantity = nil
    expect(@product.save()).to eql(false)
    expect(@product).to_not be_valid
  end

  it "is not valid without a category" do
    @product.category = nil
    expect(@product.save()).to eql(false)
    expect(@product).to_not be_valid
  end
end
