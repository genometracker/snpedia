require 'test_helper'

class SnpediaArticlesControllerTest < ActionController::TestCase
  setup do
    @snpedia_article = snpedia_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snpedia_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snpedia_article" do
    assert_difference('SnpediaArticle.count') do
      post :create, snpedia_article: { references: @snpedia_article.references, revision: @snpedia_article.revision, run_nr: @snpedia_article.run_nr, xml: @snpedia_article.xml }
    end

    assert_redirected_to snpedia_article_path(assigns(:snpedia_article))
  end

  test "should show snpedia_article" do
    get :show, id: @snpedia_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snpedia_article
    assert_response :success
  end

  test "should update snpedia_article" do
    patch :update, id: @snpedia_article, snpedia_article: { references: @snpedia_article.references, revision: @snpedia_article.revision, run_nr: @snpedia_article.run_nr, xml: @snpedia_article.xml }
    assert_redirected_to snpedia_article_path(assigns(:snpedia_article))
  end

  test "should destroy snpedia_article" do
    assert_difference('SnpediaArticle.count', -1) do
      delete :destroy, id: @snpedia_article
    end

    assert_redirected_to snpedia_articles_path
  end
end
