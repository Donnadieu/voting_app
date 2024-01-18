require 'rails_helper'

RSpec.describe "candidates/edit", type: :view do
  let(:candidate) {
    Candidate.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:candidate, candidate)
  end

  it "renders the edit candidate form" do
    render

    assert_select "form[action=?][method=?]", candidate_path(candidate), "post" do

      assert_select "input[name=?]", "candidate[name]"
    end
  end
end
