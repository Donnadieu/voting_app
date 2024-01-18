require 'rails_helper'

RSpec.describe "candidates/show", type: :view do
  before(:each) do
    assign(:candidate, Candidate.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
