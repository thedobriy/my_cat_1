class CommentsController < ApplicationController
	
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to doctor_path(@commentable)
    else
      flash[:notice] = "FAILED."
      redirect_to doctor_path(@commentable)
    end
  end

  private
	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end


    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end

