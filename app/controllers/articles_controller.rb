class ArticlesController < ApplicationController
  before_action :load_tags

  def index
    @posts = ButterCMS::Post.all({:page => 1, :page_size => 10})
  end

  def show
    @post = ButterCMS::Post.find(params[:slug])
  end

  private

  def load_tags
    @tags  = ButterCMS::Tag.all()
  end
end
