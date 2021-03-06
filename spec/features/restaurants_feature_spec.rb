require 'spec_helper'

describe 'restaurants index page' do
  context 'no restaurants have been added'do
    it 'should display a message' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
       expect(page).to have_link 'Create a restaurant'
    end
  end
end

describe 'creating a restaurant' do

  context 'logged out' do
    it 'takes us to sign up page' do
      visit '/restaurants'
      click_link 'Create a restaurant'

      expect(page).to have_content 'Sign up'
    end
  end

  context 'logged in' do
    before do
      user = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
      login_as user
    end

    context 'with valid data' do
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

    context 'with invalid data' do
      it 'shows an error' do
        visit 'restaurants/new'
        fill_in 'Name', with: 'moro'
        fill_in 'Address', with: '34'
        click_button 'Create Restaurant'
        
        expect(page).to have_content 'error'
      end
    end
  end
end

describe 'editing a restaurant' do
  before { Restaurant.create(name: 'Angels', address: 'Camberwell Church Street', cuisine: 'Spanish')}
  
  context 'logged out' do
    it 'shows no edit link' do
      visit '/restaurants' 
      expect(page).not_to have_link 'Edit Angels'
    end
  end

  context 'logged in' do
    before do
      user = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
      login_as user
    end

  context 'with valid data' do
      it 'saves the change to the restaurant' do
        visit '/restaurants'
        click_link 'Edit Angels'

        fill_in 'Name', with: 'Angels and Gipsies'
        click_button 'Update Restaurant'
        
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content 'Angels and Gipsies'
      end
    end

    context 'with invalid data' do
      it 'displays an error' do
        visit '/restaurants'
        click_link 'Edit Angels'

        fill_in 'Name', with: 'angels and gipsies'
        click_button 'Update Restaurant'
        expect(page).to have_content 'error'
      end
    end
  end
end


describe 'deleting a restaurant' do
  before { Restaurant.create(name: 'Angels', address: 'Camberwell Church Street', cuisine: 'Spanish')}

  context 'logged out' do
    it 'shows no delete link' do
      visit '/restaurants' 
      expect(page).not_to have_link 'Delete Angels'
    end
  end

  context 'logged in' do
    before do
      user = User.create(email: 'Steve@s.com', password: 'password', password_confirmation: 'password')
      login_as user
    end
    
    it 'removes the restaurant from the listing' do
      visit '/restaurants'
      click_link 'Delete Angels'
      expect(page).not_to have_content 'Angels'
      expect(page).to have_content 'Deleted successfully'
    end
  end
end
