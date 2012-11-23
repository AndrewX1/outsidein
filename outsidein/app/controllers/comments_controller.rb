class CommentsController < ApplicationController
  before_filter :require_login

  def create
    article_id = params[:comment].delete(:article_id)

    @comment = Comment.new(params[:comment])
    @comment.article_id = article_id
    @comment.save

    flash[:message] = 'Comment added to Article'
    redirect_to article_path(@comment.article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article
    @comment.destroy

    respond_to do |format|
      flash[:message] = 'Comment was successfully deleted.'
      format.html { redirect_to @article }
      format.json { head :no_content }
    end
  end
end
