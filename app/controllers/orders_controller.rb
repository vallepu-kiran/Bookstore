class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @books = Book.all
  end
  
    def show
      @order = Order.find(params[:id])
      @books = @order.books
    end
  
    def new
      @order = Order.new
    end
  
    def create
        params['order']['status'] = params['order']['status'].to_sym
        customer = Customer.find(params['order']['customer_id']) 
        @order = customer.orders.create(order_params)
        book = Book.find(params['order']['book_id']) 
        
        @order.books << book 
   
  
      if @order.books.include? book
        redirect_to customer_path(customer)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @order = Order.find(params[:id])
    end
  
    def update
      @order = Order.find(params[:id])
  
      if @order.update(order_params)
        redirect_to @order
      else
        
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @order = Order.find(params[:id])
      @order.destroy
  
      redirect_to root_path, status: :see_other
    end
  
    private
  
    def order_params
      params.require(:order).permit(:customer_id, :date_submitted, :status, :shipping, :tax)
    end
  end
  
      
