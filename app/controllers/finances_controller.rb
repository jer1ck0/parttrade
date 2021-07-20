class FinancesController < ApplicationController
  before_action :set_finance, only: [:show, :edit, :update, :destroy]

  # GET /finances
  # GET /finances.json
  def index
    @start_date = params[:start_date] ? Date.parse(params[:start_date]) : DateTime.now() - 1
    @end_date = params[:end_date] ? Date.parse(params[:end_date]) : DateTime.now()
    @finances = Finance.where(created_at: @start_date..@end_date)
  end

  # GET /finances/1
  # GET /finances/1.json
  def show
  end

  # GET /finances/new
  def new
    @finance = Finance.new
  end

  # GET /finances/1/edit
  def edit
  end

  # POST /finances
  # POST /finances.json
  def create
    @finance = Finance.new(finance_params)

    respond_to do |format|
      if @finance.save
        format.html { redirect_to @finance, notice: 'Finance was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @finance }
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finances/1
  # PATCH/PUT /finances/1.json
  def update
    respond_to do |format|
      if @finance.update(finance_params)
        format.html { redirect_to @finance, notice: 'Finance was successfully updated.' }
        format.json { render :show, status: :ok, location: @finance }
      else
        format.html { render :edit }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finances/1
  # DELETE /finances/1.json
  def destroy
    @finance.destroy
    respond_to do |format|
      format.html { redirect_to finances_url, notice: 'Finance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finance
      @finance = Finance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def finance_params
      params.require(:finance).permit(:value, :dc, :user_id, :target, :comment, :order_id)
    end
end
