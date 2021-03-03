class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :set_comment, only: %i[ show  ]



  # GET /comments/1 or /comments/1.json
  def show
  end

  

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
   @whistle = Whistle.find(params[:whistle_id])
   @comment = @whistle.comments.build(comment_params)
   @comment.user_id = current_user.id
    p @comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to whistle_path(@comment.whistle_id), notice: "Comment was successfully created." }
      else
        format.html { redirect_to whistle_path(params[:whistle_id]), alert: "An error occured #{@whistle.errors}" }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  

  # DELETE /comments/1 or /comments/1.json
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
