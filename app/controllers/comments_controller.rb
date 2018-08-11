class CommentsController < ApplicationController
  before_action :require_user
  before_action :find_comment,      except: :create
  before_action :require_same_user, except: :create

  def create
    @ticket = Ticket.find params[:ticket_id]
    @comment = Comment.new body: params[:comment][:body], ticket: @ticket, creator: current_user
    if @comment.save
      update_ticket_status
      flash[:success] = 'Comment was successfully created.'
      redirect_to ticket_path(@ticket)
    else
      render 'tickets/show'
    end
  end

  def edit
    @ticket = @comment.ticket
  end

  def update
    @ticket = @comment.ticket
    if @comment.update(body: params[:comment][:body])
      update_ticket_status
      flash[:success] = 'Comment was successfully updated.'
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment was successfully deleted.'
    redirect_to ticket_path(@comment.ticket)
  end

  private
    def find_comment
      @comment = Comment.find params[:id]
    end

    def update_ticket_status
      @ticket.update(status: params[:ticket_status]) if params[:ticket_status].present?
    end

    def require_same_user
      unless @comment.creator == current_user
        flash[:error] = 'You can only modify your own comments.'
        redirect_back fallback_location: root_path
      end
    end
end
