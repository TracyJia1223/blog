require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:poster) { create(:post) }
  let!(:user) { create(:user) }

  describe '#create' do
    def valid_request
      post(:create, params: { comment: attributes_for(:comment), post_id: poster.id })
    end
    
    context 'render the new template' do
      before { request.session[:user_id] = user.id }
      it 'saves a new comment to the database' do
        count_before = Comment.count

        valid_request
        count_after = Comment.count
        expect(count_after).to eq(count_before + 1)
      end

    end
  end
end
