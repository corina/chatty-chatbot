require 'rails_helper'

RSpec.describe Response, type: :model do
  it { should belong_to(:message) }
  it { should validate_presence_of(:content) }
end
