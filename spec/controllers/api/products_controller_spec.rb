require 'rails_helper'

describe Api::ProductsController, type: :controller do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/products').to(action: :index) }

  it { should route(:get, '/api/products/1').to(action: :show, id: 1) }

  it { should route(:post, '/api/products').to(action: :create) }

  it { should route(:patch, '/api/products/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/products/1').to(action: :destroy, id: 1) }

  before { sign_in }

  let(:product) { double }

  let(:products) { double }

  describe '#index.json' do
    before { get :index, format: :json }

    it { should render_template :index }
  end

  describe '#show.json' do
    before { subject.instance_variable_set :@product, product }

    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) do
      { name: 'Volcvagen', description: 'must have', price: 10 }
    end

    before { expect(Product).to receive(:new).with(params).and_return(product) }

    before { expect(product).to receive(:save!) }

    before { post :create, id: 1, product: params, format: :json }

    it { should render_template :create }
  end

  describe '#update.json' do
    let(:params) do
      { name: 'Volcvagen', description: 'must have', price: 10 }
    end

    before { expect(Product).to receive(:find).with('21').and_return(product) }

    before { expect(product).to receive(:update!).with(params).and_return(:true) }

    before { put :update, id: 21, product: params, format: :json }

    it { should render_template :update }
  end

  describe '#collection' do
    before { expect(Product).to receive(:all).and_return(:products) }

    its(:collection) { should eq :products }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: '1') }

    before { expect(Product).to receive(:find).with('1').and_return(:product) }

    its(:resource) { should eq :product }
  end
end
