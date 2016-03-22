require 'spec_helper'

describe ProductDecorator do
  describe '#as_json' do
    let(:product) { stub_model Product, id: 1, name: 'Test', price: 10, description: 'Very cool' }

    subject { product.decorate.as_json.symbolize_keys }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'Test' }

    its([:price]) { should eq 10 }

    its([:description]) { should eq 'Very cool' }
  end
end
