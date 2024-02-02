require 'rails_helper'

# Story 4:
RSpec.describe Animal, type: :model do
  it 'is valid with valid attributes' do
    expect(Animal.new(common_name: 'Giant Panda', scientific_binomial: 'Ailuropoda melanoleuca')).to_be_valid
  end

  it 'is not valid without a common name' do
    expect(Animal,new(scientific_binomial: 'Ailuropoda melanoleuca')).to_not_be_valid
  end
end
