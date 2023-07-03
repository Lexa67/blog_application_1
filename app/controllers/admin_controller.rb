class AdminController < ApplicationController

  def index
    @posts = Post.where(status_post: "not_aproved").order(created_at: :desc)
  end


  def posts
    @posts = Post.all.includes(:user, :comments)
  end


  def comments; end

  def users; end


  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end
end
