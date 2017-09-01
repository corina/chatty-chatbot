require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should have_many(:responses).dependent(:destroy) }
  it { should validate_presence_of(:content) }
end
