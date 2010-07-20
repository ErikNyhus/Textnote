class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all(:order => "created_at DESC", :limit => 3)
    @lastpage = Post.count.quo(3).ceil
    @pagenum = (1..@lastpage)
    @nextURL = '/blog/2'
  end
  
  def blogpage
    @nextURL = '/blog/' + (params[:page].to_i+1).to_s
    @previousURL = '/blog/' + (params[:page].to_i-1).to_s
    @offset = (params[:page].to_i-1)*3
    @posts = Post.all(:order => "created_at DESC", :offset => @offset, :limit => 3)
    @lastpage = Post.count.quo(3).ceil
    @pagenum = (1..@lastpage)
    @testvalue = 0
    for item in @pagenum do
      if params[:page].to_i == item then
        render :index
        @testvalue = 1
      end
    end
    if @testvalue == 0
      redirect_to '/blog'
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
