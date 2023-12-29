class ReviewsController < ApplicationController
    def index
        @reviews = Review.all 
      end
      
    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.new
    end
  
    def create
        book = Book.find(params[:book_id])
      @review = book.reviews.create(review_params)
  
      if @review.save
        redirect_to book_path(book.id), notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:body, :customer_id,:book_id)
    end
end
