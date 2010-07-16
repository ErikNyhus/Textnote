class PagesController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def blog
  end

  def about
  end

end
