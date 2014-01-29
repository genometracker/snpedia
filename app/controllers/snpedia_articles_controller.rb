class SnpediaArticlesController < ApplicationController
  before_action :set_snpedia_article, only: [:show, :edit, :update, :destroy]

  # GET /snpedia_articles
  # GET /snpedia_articles.json
  def index
    @snpedia_articles = SnpediaArticle.all
  end

  # GET /snpedia_articles/1
  # GET /snpedia_articles/1.json
  def show
  end

  # GET /snpedia_articles/new
  def new
    @snpedia_article = SnpediaArticle.new
  end

  # GET /snpedia_articles/1/edit
  def edit
  end

  # POST /snpedia_articles
  # POST /snpedia_articles.json
  def create
    @snpedia_article = SnpediaArticle.new(snpedia_article_params)

    respond_to do |format|
      if @snpedia_article.save
        format.html { redirect_to @snpedia_article, notice: 'Snpedia article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @snpedia_article }
      else
        format.html { render action: 'new' }
        format.json { render json: @snpedia_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snpedia_articles/1
  # PATCH/PUT /snpedia_articles/1.json
  def update
    respond_to do |format|
      if @snpedia_article.update(snpedia_article_params)
        format.html { redirect_to @snpedia_article, notice: 'Snpedia article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @snpedia_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snpedia_articles/1
  # DELETE /snpedia_articles/1.json
  def destroy
    @snpedia_article.destroy
    respond_to do |format|
      format.html { redirect_to snpedia_articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snpedia_article
      @snpedia_article = SnpediaArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snpedia_article_params
      params.require(:snpedia_article).permit(:revision, :run_nr, :xml, :references)
    end
end
