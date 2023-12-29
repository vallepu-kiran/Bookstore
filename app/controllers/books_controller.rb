class BooksController < ApplicationController
    def index
        @books = Book.all
        @ten_years_old_books = Book.where('year_published < ?', 10.years.ago.year)
      end
      def show
        @book = Book.find(params[:id])
        @reviews = @book.reviews
        orders= @book.orders
        
        @customers = Customer.joins(:orders).where(orders: { id: orders }).distinct
        
      
      end
      def show_all_customers
      end
      def new
        @book = Book.new
      end
    
      def create
        @book = Book.new(book_params)
    
        if @book.save
          redirect_to @book
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @book = Book.find(params[:id])
      end
    
      def update
        @book = Book.find(params[:id])
    
        if @book.update(book_params)
          redirect_to @book
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @book = Book.find(params[:id])
        @book.destroy
    
        redirect_to root_path, status: :see_other
      end
    
      private
        def book_params
          params.require(:book).permit(:title,:author_id, :year_published, :isbn, :price)
        end
end


