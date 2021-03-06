class TagsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :find_tag, only: [:edit, :update, :destroy]

  def index 
    # SELECT DISTINCT tags.*, COUNT(tag_tickets.tag_id) AS tickets_count FROM tags
    # LEFT OUTER JOIN tag_tickets ON tags.id = tag_tickets.tag_id
    # GROUP BY tags.id;
    @tags = Tag.left_outer_joins(:tag_tickets).distinct.select('tags.*, COUNT(tag_tickets.tag_id) AS tickets_count').group('tags.id')
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new get_params
    if @tag.save
      flash[:success] = 'Tag was successfully created.'
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update get_params
      flash[:success] = 'Tag was successfully updated.'
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    flash[:success] = 'Tag was successfully deleted.'
    redirect_to tags_path
  end

  private
    def find_tag
      @tag = Tag.find params[:id]
    end

    def get_params
      params.require(:tag).permit(:name)
    end
end
