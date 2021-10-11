class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy]
  after_action :send_mail, only: :show
  before_action :authenticate_user!

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1 or /invoices/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice No. #{@invoice.id}",
               page_size: 'A4',
               template: "invoices/show.html.erb",
               layout: "pdf.html",
               orientation: "Portrait",
               lowquality: true,
               zoom: 1,
               save_to_file: Rails.root.join('tmp', "premium_invoice_#{@invoice.id}.pdf"),
               dpi: 75
      end
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: "Invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:to_email, :to_phone,:policy_no, :date_of_commencement_of_policy,:date_of_commencement_of_risk, :plan_and_policy,
                                      :date_of_maturity, :basic_sum_assured, :accidental_benefit_sum_assured, :premium_for_plan, :total_premium_amount_rs,
                                      :date_for_paid, :date_of_birth_of_assured, :age_of_the_life_assured, :nominee_name, :nominee_relation, :proposal_no,
                                      :date_of_proposal, :assured_full_name, :name_of_proposer, :address_of_proposer, :address_of_assured)
    end

    def send_mail
      if params[:format] == "pdf"
        SendReportMailer.send_report(@invoice.id).deliver_now
      end
    end
end
