class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validate  :content, presence: ture
end
