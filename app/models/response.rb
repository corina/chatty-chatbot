class Response < ApplicationRecord
  belongs_to :message
  validates_presence_of :content
end
