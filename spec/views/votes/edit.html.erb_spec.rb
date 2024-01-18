require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  let(:vote) {
    Vote.create!(
      user: nil,
      candidate: nil
    )
  }

  before(:each) do
    assign(:vote, vote)
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(vote), "post" do

      assert_select "input[name=?]", "vote[user_id]"

      assert_select "input[name=?]", "vote[candidate_id]"
    end
  end
end
