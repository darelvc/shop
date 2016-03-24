require 'rails_helper'

describe Api::PurchasesController, type: :controller do
  it { should be_a Api::BaseController }

  it { should route(:get, '/api/purchases/1').to(action: :show, id: 1) }

  it { should route(:post, '/api/purchases').to(action: :create) }

  it { should route(:patch, '/api/purchases/1').to(action: :update, id: 1) }

  it { should route(:delete, '/api/purchases/1').to(action: :destroy, id: 1) }

  before { sign_in }

  let(:purchase) { double }

  describe '#show.json' do
    before { subject.instance_variable_set :@purchase, purchase }

    before { get :show, id: 1, format: :json }

    it { should render_template :show }
  end

  describe '#create.json' do
    let(:params) do
      { product_id: 37, user_id: subject.current_user.id, quantity: 6 }
    end

    before do
      #
      # Purchase.new(params) -> purchase
      #
      expect(Purchase).to receive(:new).with(params).and_return(purchase)
    end

    before { expect(purchase).to receive(:save!) }

    before { post :create, id: 1, purchase: params, format: :json }

    it { should render_template :create }
  end

  describe '#update.json' do
    let(:params) do
      { product_id: 37, user_id: subject.current_user.id, quantity: 24 }
    end

    before { expect(Purchase).to receive(:find).with('21').and_return(purchase) }

    before { expect(purchase).to receive(:update!).with(params).and_return(:true) }

    before { put :update, id: 21, purchase: params, format: :json }

    it { should render_template :update }
  end

  describe '#destroy' do
    before { expect(Purchase).to receive(:find).with('21').and_return(purchase) }

    before { expect(purchase).to receive(:destroy!) }

    before { delete :destroy, id: 21, format: :json }

    it { should respond_with :ok }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return(id: '1') }

    before { expect(Purchase).to receive(:find).with('1').and_return(:purchase) }

    its(:resource) { should eq :purchase }
  end
end
