require 'spec_helper'
require './recipe'

RSpec.describe Recipe, vcr: true do
  describe '.all' do
    it 'returns a list of recipes' do
      expect(Recipe.all.size).to eq 4
    end

    it 'converts entries to recipes' do
      expect(Recipe.all.all?{|recipe| recipe.is_a? Recipe}).to be true
    end
  end

  describe 'basic attributes' do
    let(:recipe) { Recipe.new('4dT8tcb6ukGSIg2YyuGEOm')}

    it { expect(recipe.title).to eq 'White Cheddar Grilled Cheese with Cherry Preserves & Basil' }
    it { expect(recipe.description).to_not be nil }
    it { expect(recipe.image_url).to eq '//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg' }
  end

  describe '#tags' do
    it 'lists tags when present' do
      recipe = Recipe.new('4dT8tcb6ukGSIg2YyuGEOm')
      expect(recipe.tags).to eq ['vegan']
    end

    it 'returns empty array if there are no tags' do
      recipe = Recipe.new('5jy9hcMeEgQ4maKGqIOYW6')
      expect(recipe.tags).to eq []
    end
  end

  describe '#chef_name' do
    it 'shows chef name when present' do
      recipe = Recipe.new('2E8bc3VcJmA8OgmQsageas')
      expect(recipe.chef_name).to eq 'Mark Zucchiniberg'
    end

    it 'returns nil if no chef name is present' do
      recipe = Recipe.new('4dT8tcb6ukGSIg2YyuGEOm')
      expect(recipe.chef_name).to eq nil
    end
  end
end
