class Candidate < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :name, presence: true, uniqueness: {
    message: ->(object, data) do
      "#{object.name} is already a candidate."
    end
  }
  validate :validate_candidate_count_within_limit, on: :create

  accepts_nested_attributes_for :votes, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }

  private
  def validate_candidate_count_within_limit
    if Candidate.count >= 10
      errors.add(:base, "You can only have 10 candidates.")
    end
  end
end
