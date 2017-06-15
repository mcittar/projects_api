require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:incomplete_country) { Country.new }
  
  it "validates presence of name" do
    expect(incomplete_country).not_to be_valid
  end
end
