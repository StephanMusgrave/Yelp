require 'spec_helper'

describe 'restaurants index page' do
  context 'no restaurants have been added'do
    it 'should display a message' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
    end
  end
end

describe 'creating a restaurant' do
  it 'adds it to the restaurants index' do
    visit 'restaurants/new'
    fill_in 'Name',     with: 'Moro'
    fill_in 'Address',  with: '34 Exmouth Market, London'
    click_button 'Create Restaurant'
    expect(current_path).to eq   '/restaurants'
    expect(page).to have_content 'Moro'
  end
end
