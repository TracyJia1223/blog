class LikesController < ApplicationController
  before_action :require_user
  def create
    post = Post.find params[:post_id]
    like = Like.new(user: current_user, post: post)
    if post.user == current_user
      flash[:danger] = "You can't like your own post."
    else like.save
      flash[:success] = 'Like successfully!'
    end
    redirect_to post_path(post)
  end

  def destroy
    like = Like.find params[:id]
    post = like.post
    if like.destroy
      flash[:success] = 'Dislike successfully!'      
    end
    redirect_to post_path(post)
  end
end
