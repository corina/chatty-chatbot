require 'rails_helper'

feature "Front end" do

  before do
    visit '/'
  end

  describe 'Hello', js: true do
    it 'lists first question and corresponding answers' do
      click_on 'Hello'
      expect(page).to have_content 'Do you want to play a game?'
      expect(page).to have_button('Yes')
      expect(page).to have_button('No')
    end
  end

  describe 'response button', js: true do
    it 'lists the next message and corresponding responses' do
      click_on 'Hello'
      click_on 'Yes'
      expect(page).to have_content 'You\'ve chosen trivia. What are penguins famous for?'
      expect(page).to have_button('They can fly')
      expect(page).to have_button('They have black and white plumage')
      expect(page).to have_button('They are reptiles')
    end
  end


end
