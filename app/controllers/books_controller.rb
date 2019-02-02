class BooksController < ApplicationController
    def index
        if !params.key?(:books)
          params[:books] = {}
        end
        generesss = params[:generes] ? params[:generes].keys : []
        permitted = params.permit(:sort, :generes => generesss)
        sort = params[:sort] || session[:sort]
        case sort
            when 'title'
              ordering,@title_header = {:title => :asc}, 'hilite'
            when 'publish_date'      
              ordering,@date_header = {:publish_date => :asc}, 'hilite'
        end
        
        # edit the index method of the movies_controller.rb
        @all_generes = Book.all_generes  
        @selected_generes = permitted[:generes] || session[:generes] || {}
        if @selected_generes == {}  
          @selected_generes = Hash[@all_generes.map {|genere| [genere, genere]}]
        end
        
        if permitted[:sort] != session[:sort] or permitted[:generes] != session[:generes]
          session[:sort] = sort
          session[:generes] = @selected_generes
         redirect_to :sort => sort, :generes => @selected_generes and return
        end
        
        # @books = Book.all
        # @books = Book.order(ordering)
        @books = Book.where(genere: @selected_generes.keys).order(ordering)
    end
    
    def show
        id = params[:id] # retrieve book title from URI route
        @book = Book.find(id) # look up book by unique ID
        # will render app/views/books/show.html.haml by default
    end
    
    def new
        @book = Book.new
    end
    
    def create
      params.require(:book)
      permitted = params[:book].permit(:title, :genere, :description, :isbn_number, :publish_date, :author)
      @book = Book.create!(permitted)
      flash[:notice] = "#{@book.title} was successfully created."
      redirect_to books_path
    end
    
    def edit
        @book = Book.find params[:id]
    end
    
    def update
        @book = Book.find params[:id]
        params.require(:book)
        permitted = params[:book].permit(:title, :genere, :description, :isbn_number, :release_date, :author)
        @book.update_attributes!(permitted)
        flash[:notice] = "#{@book.title} was successfully updated."
        redirect_to book_path(@book)
    end
    
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      flash[:notice] = "Book '#{@book.title}' deleted."
      redirect_to books_path
    end
    
    def show_same
      @book = Book.find(params[:id])
      @books_except_self = Book.where.not(title: @book.title)
      @same_author_books = @books_except_self.where(author: @book.author)
      if @same_author_books.empty? then 
        redirect_to books_path 
        flash[:notice] = "'#{@book.title}' has no author info"
      end
    end
end