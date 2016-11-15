class LikesController < ApplicationController
  before_action :require_user
  def create
    post = Post.find params[:post_id]
    like = Like.new(user: current_user, post: post)
    if post.user == current_user
      flash[:danger] = "You can't like your own post."
      redirect_to post_path(post)
    elsif like.save
      flash[:success] = "Like successfully!"
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end

  def destroy
    like = Like.find params[:id]
    post = like.post
    if like.destroy
      flash[:success] = "Dislike successfully!";
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end
end
