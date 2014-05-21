require 'spec_helper'

describe 'writing reviews' do
  before { Restaurant.create(name: 'Moro', address: 'Exmouth Market', cuisine: 'Spanish')}

  specify 'restaurants begin with no reviews' do
    visit '/restaurants'
    expect(page).to have_content '0 reviews'
  end

  it 'adds the review to the restaurant' do
    visit '/restaurants'
    click_link 'Review Moro'

    fill_in 'Thoughts', with: 'Good but noisy'
    select '4', from: 'Rating' 
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Good but noisy'
    expect(page).to have_content '1 review'
  end
end