class PostsController < ApplicationController
  def nopage
    redirect_to '/blog/1'
  end
  
  def index
    
    @title = "Blog"
    
    @page = params[:page].to_i
    @last_page = Post.count.quo(3).ceil
    @posts = Post.all(:order => "created_at DESC", :offset => (@page-1)*3, :limit => 3)
    @valid_page = false
    for item in (1..@last_page) do
      if @page == item then
        @valid_page = true
      end
    end
    if @valid_page == true then
      return false
    else
      redirect_to '/blog/1'
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

end
