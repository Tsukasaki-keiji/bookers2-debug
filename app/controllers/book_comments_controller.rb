class BookCommentsController < ApplicationController

  def create
    user = current_user
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
    # comment = current_user.book_comments.new(book_comment_params)
    # comment.save
    # redirect_to books_path(book_comment)
  end

  def destroy
    comment = BookComment.find(params[:book_id])
    book = comment.book
    comment.destroy
    redirect_to book_path(book)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
