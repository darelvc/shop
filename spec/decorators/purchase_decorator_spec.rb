require 'rails_helper'

describe PurchaseDecorator do
  let(:purchase) { stub_model Purchase, id: 25, quantity: 20 }

  subject { purchase.decorate }

  before { expect(subject).to receive(:product).and_return(:product) }

  its('as_json.symbolize_keys') do
    should eq \
      id: 25,
      quantity: 20,
      product: :product
  end
end


