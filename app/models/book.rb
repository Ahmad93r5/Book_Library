class Book < ApplicationRecord
               before_save :capitalize_title
               after_create :log_book_creation
               private
               def capitalize_title
                  self.title = title.titleize if title.present?
               end
               def log_book_creation
                  Rails.logger.info "Book '#{title}' created successfully."
               end

  validates :title,
             presence: true,
             length: { minimum: 2 },
             uniqueness: true

  validates :author,
             presence: true,
             length: { minimum: 3 },
             uniqueness: true

   validates :price,
             presence: true,
             numericality: { greater_than: 0 }

   validates :published_year,
             presence: true

   validates :available,
             presence: true

             belongs_to :category
end
