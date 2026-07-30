class Book < ApplicationRecord

  validates :title, 
             presence: true,
             length: {minimum: 2},
             uniqueness: true
  
  validates :author, 
             presence: true,
             length: {minimum: 3},
             uniqueness: true

   validates :price, 
             presence: true,
             numericality: {greater_than: 0}

   validates :published_year, 
             presence: true

   validates :available, 
             presence: true

             belongs_to :category

end
