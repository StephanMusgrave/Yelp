 require 'spec_helper'

describe 'writing reviews' do
  before { Restaurant.create(name: 'Moro', address: 'Exmouth Market', cuisine: 'Spanish')}

  context 'logged out' do 
    it 'does not show the review form'do
    visit '/restaurants'
      expect(page).not_to have_field('Thoughts')
    end
  end

  context 'logged in' do 
    
    specify 'restaurants begin with no reviews' do
      visit '/restaurants'
      expect(page).to have_content '0 reviews'
    end

    it 'adds the review to the restaurant', js: true do
      leave_review(4, 'Good but noisy')
      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'Good but noisy'
      expect(page).to have_content '1 review'
    end

    it 'calculates the average of reviews', js: true do
      leave_review(5, 'Good but noisy')
      leave_review(2, 'Poor')
      expect(page).to have_content '3.5'
    end
  end

  def leave_review(rating, thoughts)
    visit '/restaurants'
    # click_link 'Review Moro'

    fill_in 'Thoughts', with: thoughts
    select rating.to_s, from: 'Rating' 
    click_button 'Leave Review'
  end

end