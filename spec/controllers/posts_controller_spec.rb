require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create(:user) }

  describe '#create' do
    before { request.session[:user_id] = user.id }
    context 'with valid params' do
      def valid_request
        post :create, params: { post: attributes_for(:post) }
      end

      it 'saves a Record to the database' do
        count_before = Post.count
        valid_request
        count_after = Post.count
        expect(count_after).to eq(count_before + 1)
      end
      it 'redirects to the product show page' do
        valid_request
        expect(response).to redirect_to(post_path(Post.last))
      end
    end
  end
end
