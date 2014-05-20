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
    fill_in 'Name', with: 'Moro'
    fill_in 'Address', with: '34 Exmouth Market, London'
    fill_in 'Cuisine', with: 'Spanish'
    click_button 'Create Restaurant'

    expect(current_path).to eq   '/restaurants'
    expect(page).to have_content 'Moro'
  end
end

describe 'editing a restaurant' do
  before { Restaurant.create(name: 'Angels', address: 'Camberwell Church Street')}
  
  it 'saves the change to the restaurant' do
    visit '/restaurants'
    click_link 'Edit Angels'
    fill_in 'Name', with: 'Angels and Gipsies'
    click_button 'Update Restaurant'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Angels and Gipsies'
  end
end

describe 'deleting a restaurant' do
  before { Restaurant.create(name: 'Angels', address: 'Camberwell Church Street')}
  
  it 'removes the restaurant from the listing' do
    visit '/restaurants'
    click_link 'Delete Angels'
    expect(page).not_to have_content 'Angels'
    expect(page).to have_content 'Deleted successfully'
  end
end
