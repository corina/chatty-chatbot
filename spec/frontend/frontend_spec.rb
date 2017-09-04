require 'rails_helper'

feature "Front end" do
  describe 'some stuff which requires js', js: true do

    # it 'will use the default js driver'
    it 'will switch to one specific driver' do
      visit '/'
      click_on 'Hello'
      expect(page).to have_content('foo')
    end
  end
end
