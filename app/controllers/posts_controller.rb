class PostsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]
    def index
    end    

def create
  @post = Post.find(params[:id])
  @post.create(post_params)
  redirect_to root_path
end

def new
  @post = Post.new
end

def create
  @post = current_user.posts.create(post_params)
  if @post.valid?
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

private

def post_params
  params.require(:post).permit(:user_id, :photo, :description)
end


end
