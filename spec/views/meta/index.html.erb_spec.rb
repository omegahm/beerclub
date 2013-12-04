require 'spec_helper'

describe 'meta/index' do
  before(:each) do
    assign(:meta, [
      stub_model(Metum,
                 cash: 1.5,
                 loss: 1.5,
                 stock: 1.5,
                 created_at: Date.today
      ),
      stub_model(Metum,
                 cash: 1.5,
                 loss: 1.5,
                 stock: 1.7,
                 created_at: Date.today
      )
    ])
  end

  it 'renders a list of meta' do
    render
    assert_select 'tr>td', text: 'Slet', count: 2
  end
end
