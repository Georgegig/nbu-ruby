class Book < ApplicationRecord
    # add to app/models/Books.rb
    def self.all_generes; 
        ['Science fiction', 'Drama', 'Action and adventure', 'Romance', 'Mystery', 'Horror']; 
    end #  shortcut: array of strings
end