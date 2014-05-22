require 'spec_helper'

describe ReviewsHelper do
  describe '#star_rating' do

  it 'returns 5 filled stars for 5' do
    expect(star_rating(5)).to eq '★★★★★'
  end

  it 'returns x filled stars, with the remainder is < 5' do
    expect(star_rating(3)).to eq '★★★☆☆'
    
  end

  it 'if value is not anumber, return it unchanged' do
    expect(star_rating('N/A')).to eq 'N/A'
    
  end

  it 'rounds to the nearest whole star' do
    expect(star_rating(3.7)).to eq '★★★★☆'
    
  end

  end
end

# ★ ☆
