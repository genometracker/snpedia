class MedicalConditionsController < ApplicationController
  before_action :set_medical_condition, only: [:show, :edit, :update, :destroy]

  # GET /medical_conditions
  # GET /medical_conditions.json
  def index
    @medical_conditions = MedicalCondition.all
  end

  # GET /medical_conditions/1
  # GET /medical_conditions/1.json
  def show
  end

  # GET /medical_conditions/new
  def new
    @medical_condition = MedicalCondition.new
  end

  # GET /medical_conditions/1/edit
  def edit
  end

  def start
    Resque.enqueue(ReadMedicalConditionsJob,nil)
  end

  # POST /medical_conditions
  # POST /medical_conditions.json
  def create
    @medical_condition = MedicalCondition.new(medical_condition_params)

    respond_to do |format|
      if @medical_condition.save
        format.html { redirect_to @medical_condition, notice: 'Medical condition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medical_condition }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_conditions/1
  # PATCH/PUT /medical_conditions/1.json
  def update
    respond_to do |format|
      if @medical_condition.update(medical_condition_params)
        format.html { redirect_to @medical_condition, notice: 'Medical condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_conditions/1
  # DELETE /medical_conditions/1.json
  def destroy
    @medical_condition.destroy
    respond_to do |format|
      format.html { redirect_to medical_conditions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_condition
      @medical_condition = MedicalCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_condition_params
      params.require(:medical_condition).permit(:name)
    end
end
