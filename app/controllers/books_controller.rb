class BooksController < ApplicationController
  def top
  end

  def index
  	@book = Book.new
  	@index = Book.all
  end

   def create
    
     book = Book.new(book_params)
    
     if book.save
       redirect_to book_path(book.id), notice: 'successfully'
     else
      @book = book
      @index = Book.all
      render :index
      end
   end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      
      if @book.update(book_params)
         redirect_to book_path(@book.id), notice: 'successfully'

       else

        render :edit

      end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book.id), notice: 'successfully'
  end

  private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
