class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params.merge(user: current_user))

    respond_to do |format|
      if @ticket.save
        format.turbo_stream { render turbo_stream: turbo_stream.append(
          'ticket_list', partial: 'tickets/ticket', locals: { ticket: @ticket }) }
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          'remote_modal', partial: 'tickets/modal',
          locals: { ticket: @ticket, modal_title: 'Create Ticket', partial_name: 'form' }) }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          "ticket_row_#{@ticket.id}", partial: 'tickets/ticket',
          locals: { ticket: @ticket }) }
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(
          'remote_modal', partial: 'tickets/modal',
          locals: { ticket: @ticket, modal_title: 'Edit Ticket', partial_name: 'form' }) }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("ticket_row_#{@ticket.id}") }
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :content, :department_id, :status)
    end
end
