class GwasResultsController < ApplicationController
  before_action :set_gwas_result, only: [:show, :edit, :update, :destroy]

  # GET /gwas_results
  # GET /gwas_results.json
  def index
    @gwas_results = GwasResult.all
  end

  # GET /gwas_results/1
  # GET /gwas_results/1.json
  def show
  end

  # GET /gwas_results/new
  def new
    @gwas_result = GwasResult.new
  end

  # GET /gwas_results/1/edit
  def edit
  end

  def gdgr
    ReadGenomeDotGovResultJob.perform
  end

  # POST /gwas_results
  # POST /gwas_results.json
  def create
    @gwas_result = GwasResult.new(gwas_result_params)

    respond_to do |format|
      if @gwas_result.save
        format.html { redirect_to @gwas_result, notice: 'Gwas result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gwas_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @gwas_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gwas_results/1
  # PATCH/PUT /gwas_results/1.json
  def update
    respond_to do |format|
      if @gwas_result.update(gwas_result_params)
        format.html { redirect_to @gwas_result, notice: 'Gwas result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gwas_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gwas_results/1
  # DELETE /gwas_results/1.json
  def destroy
    @gwas_result.destroy
    respond_to do |format|
      format.html { redirect_to gwas_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gwas_result
      @gwas_result = GwasResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gwas_result_params
      params.require(:gwas_result).permit(:snp_id, :risk_allele, :effect_size, :p_value, :article_url, :article_title)
    end
end
