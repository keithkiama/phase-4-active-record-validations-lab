class Post < ApplicationRecord
    validates :title_is_clickbait
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    def title_is_clickbait
      unless title.match?(/(secret)|(won't believe)|(top \d)/i)
        errors.add(:title, "Title must be clickbait")
      end
    end
end
