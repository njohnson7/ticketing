class TicketsController < ApplicationController
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new params.require(:ticket).permit(:name, :description)
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
    if @ticket.update params.require(:ticket).permit(:name, :description)
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
end
