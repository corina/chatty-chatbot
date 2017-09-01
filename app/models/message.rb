class Message < ApplicationRecord
  has_many :responses, dependent: :destroy
  validates_presence_of :content
end
