require "rails_helper"
describe BooksController do
 describe 'Search books with the same author' do
     it 'finds the book with the given id' do
        given_book = double("Book_1", title: 'Harry Potter 1', author: 'Georgi')
        expect(Book).to receive(:find).with("1").and_return(given_book)
        get :show_same, params: {id:1}
     end
     it 'redirects to movies_path with notice' do
        given_book = double("Book_1", title: 'Harry Potter 1', author: '')
        expect(Book).to receive(:find).with("1").and_return(given_book)
        get :show_same, params: {id:1}
        expect(flash[:notice]).to eq "'#{given_book.title}' has no author info"
        expect(response).to redirect_to(books_path)
     end
 end
end
