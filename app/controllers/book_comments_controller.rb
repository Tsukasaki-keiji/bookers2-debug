class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
    @book_comments = @book.book_comments
    @comment = BookComment.new

    # comment = current_user.book_comments.new(book_comment_params)
    # comment.save
    # redirect_to books_path(book_comment)
  end

  def destroy
    comment = BookComment.find(params[:id])
    book = comment.book
    comment.destroy
    @book_comments = book.book_comments
    @book = Book.find(params[:book_id])
    @comment = BookComment.new
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
