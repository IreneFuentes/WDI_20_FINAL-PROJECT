class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comment = Comment.new
    @comments = Comment.all
  end

  # POST /comments
  # POST /comments.json
  def create
   current_user.comments.create(comment_params)
   redirect_to comments_path, notice: 'Comment was successfully created.'
  end
 

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
