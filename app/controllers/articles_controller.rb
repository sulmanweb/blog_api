class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :update, :destroy, :change_status]

  # GET /articles
  # GET /articles.json
  def index
    if user_signed_in? and current_user.admin?
      @articles = Article.all
    else
      @articles = Article.for_general_users
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.status = Rails.configuration.constants['article_status_draft']

    authorize @article

    if @article.save
      render status: :created, template: 'articles/show'
    else
      render json: {errors: @article.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    authorize @article
    if @article.update(article_params)
      render status: :ok, template: 'articles/show'
    else
      render json: {errors: @article.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize @article
    @article.destroy
  end

  def change_status
    authorize @article
    if @article.update(article_change_status_params)
      render status: :ok, template: 'articles/show'
    else
      render json: {errors: @article.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      if user_signed_in?
        @article = Article.friendly.find(params[:id])
      else
        @article = Article.for_general_users.friendly.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :editor)
    end

    def article_change_status_params
      params.require(:article).permit(:status)
    end
end
