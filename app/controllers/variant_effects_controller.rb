class VariantEffectsController < ApplicationController
  before_action :set_variant_effect, only: [:show, :edit, :update, :destroy]

  # GET /variant_effects
  # GET /variant_effects.json
  def index
    @variant_effects = VariantEffect.all.page(params[:page])
  end

  # GET /variant_effects/1
  # GET /variant_effects/1.json
  def show
  end

  # GET /variant_effects/new
  def new
    @variant_effect = VariantEffect.new
  end

  # GET /variant_effects/1/edit
  def edit
  end

  # POST /variant_effects
  # POST /variant_effects.json
  def create
    @variant_effect = VariantEffect.new(variant_effect_params)

    respond_to do |format|
      if @variant_effect.save
        format.html { redirect_to @variant_effect, notice: 'Variant effect was successfully created.' }
        format.json { render action: 'show', status: :created, location: @variant_effect }
      else
        format.html { render action: 'new' }
        format.json { render json: @variant_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variant_effects/1
  # PATCH/PUT /variant_effects/1.json
  def update
    respond_to do |format|
      if @variant_effect.update(variant_effect_params)
        format.html { redirect_to @variant_effect, notice: 'Variant effect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @variant_effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variant_effects/1
  # DELETE /variant_effects/1.json
  def destroy
    @variant_effect.destroy
    respond_to do |format|
      format.html { redirect_to variant_effects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant_effect
      @variant_effect = VariantEffect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variant_effect_params
      params.require(:variant_effect).permit(:snp_id, :variant, :description)
    end
end
