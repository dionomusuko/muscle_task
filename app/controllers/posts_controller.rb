class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = set_post
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿「#{@post.title}」を削除しました"
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "投稿「#{@post.title}」を保存しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を「#{@post.title}」更新しました"
    else
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
