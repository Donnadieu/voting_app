class User < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :zip_code, presence: true
end
