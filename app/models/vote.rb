class Vote < ApplicationRecord
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
end
