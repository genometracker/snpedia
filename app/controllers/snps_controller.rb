class SnpsController < ApplicationController
  before_action :set_snp, only: [:show, :edit, :update, :destroy]

  # GET /snps
  # GET /snps.json
  def index
    @snps = Snp.all
  end

  # GET /snps/1
  # GET /snps/1.json
  def show
  end

  # GET /snps/new
  def new
    @snp = Snp.new
  end

  # GET /snps/1/edit
  def edit
  end

  # GET /snps/start
  def start
    Snp.delete_all

    job=SnpediaReadSnpsJob.new
    job.work(nil)

    #Resque.enqueue(SnpediaReadSnpsJob,nil)

    redirect_to snps_path
  end

  # GET /snps/start/details
  def start_details

    job=SnpediaReadSnpDetailsJob.new
    job.work()

    redirect_to snps_path
  end

  # POST /snps
  # POST /snps.json
  def create
    @snp = Snp.new(snp_params)

    respond_to do |format|
      if @snp.save
        format.html { redirect_to @snp, notice: 'Snp was successfully created.' }
        format.json { render action: 'show', status: :created, location: @snp }
      else
        format.html { render action: 'new' }
        format.json { render json: @snp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snps/1
  # PATCH/PUT /snps/1.json
  def update
    respond_to do |format|
      if @snp.update(snp_params)
        format.html { redirect_to @snp, notice: 'Snp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @snp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snps/1
  # DELETE /snps/1.json
  def destroy
    @snp.destroy
    respond_to do |format|
      format.html { redirect_to snps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snp
      @snp = Snp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snp_params
      params.require(:snp).permit(:rs_number, :snpedia_revision)
    end
end
