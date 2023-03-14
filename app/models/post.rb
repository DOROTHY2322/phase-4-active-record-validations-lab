class Post < ApplicationRecord
    validates :title, presence: true, exclusion: { in: ['True Facts'] }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  
    validate :title_is_clickbait
  
    private
  
    def title_is_clickbait
      if title == "You Won't Believe These True Facts"
        errors.add(:title, "cannot be clickbait")
      end
    end
  end
  