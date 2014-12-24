class PostsController < ApplicationController

  def new
    @post = Post.new
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def create
    post_params[:category_id] = post_params[:category_id].to_i
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  private def post_params
    params.require(:post).permit(:category_id, :title, :description, :email)
  end

end
