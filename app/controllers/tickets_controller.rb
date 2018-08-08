class TicketsController < ApplicationController
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.where params.permit(:project, :status).reject { |k, v| v.blank? }
    tag = params.permit(:tag)[:tag]
    @tickets = @tickets.select { |ticket| ticket.tags.map(&:id).include? tag.to_i } unless tag.blank?
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new get_params
    if @ticket.save
      flash[:success] = 'Ticket was successfully created.'
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update get_params
      flash[:success] = 'Ticket was successfully updated.'
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    flash[:success] = 'Ticket was successfully deleted.'
    redirect_to tickets_path
  end

  private
    def find_ticket
      @ticket = Ticket.find params[:id]
    end

    def get_params
      params.require(:ticket).permit(:project_id, :name, :body, :status, :tags)
    end
end
