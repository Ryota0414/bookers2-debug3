class PostComment < ApplicationRecord
    def create
        book = Book.find(params[:book_id])
        comment = current_user.post_comments.new(post_comment_params)
        comment.booke_id = book.id
        comment.save
        redirect_to book_path(book)
    end

  private

  def book_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
