class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def index
    @comments = @article.comments.all
  end

  def create
    @comment = @article.comments.build(comment_create_params)
    @comment.user = current_user

    if @comment.save
      render status: :created, template: 'comments/show'
    else
      render status: :unprocessable_entity, json: {erros: @comment.errors.full_messages}
    end
  end

  private
  def set_article
    @article = Article.for_general_users.find(params[:article_id])
  end

  def comment_create_params
    params.require(:comment).permit(:content)
  end
end
