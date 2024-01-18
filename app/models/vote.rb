class Vote < ApplicationRecord
  after_commit :broadcast_vote, on: [:create, :update]

  belongs_to :user
  belongs_to :candidate

  validates :user_id, uniqueness: {
    message: ->(object, data) do
      "#{object.user.email} has already voted."
    end
  }

  validate :validate_vote_count_within_limit, on: :create

  private
  def validate_vote_count_within_limit
    if Vote.count >= 50
      errors.add(:base, "You can only vote 50 times.")
    end
  end

  def broadcast_vote
    ActionCable.server.broadcast "vote_channel", {
      vote_count: self.candidate.votes.count,
      candidate_id: self.candidate.id,
      candidate_name: self.candidate.name
    }
  end
end
