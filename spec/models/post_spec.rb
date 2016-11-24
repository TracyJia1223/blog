require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title' do
      p = FactoryGirl.build :post, title: nil
      p.valid?
      expect(p.errors).to have_key(:title)
    end

    it 'requires a body' do
      p = FactoryGirl.build :post, body: nil
      p.valid?
      expect(p.errors).to have_key(:body)
    end

    it 'requires a unique title' do
      FactoryGirl.create :post, title: 'sometitle'
      # Product.create title: 'sometitle', price: 80
      p = Post.new title: 'sometitle'
      p.valid?
      expect(p.errors).to have_key(:title)
    end
  end
end
