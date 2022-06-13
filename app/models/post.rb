class Post < ApplicationRecord
    validates :title, presence: :true
    validates :content, length: { minimum: 250 } 
    validates :summary, length: { maximum: 250 }
    # validates :size, inclusion: { in: %w(small medium large),
    #     message: "%{value} is not a valid size" }

    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    # custom validation
    validate :title_throw_error

    def title_throw_error
        words = [
            /Won't Believe/i,
            /Secret/i,
            /Top \d/i,
            /Guess/i
          ] 
        if words.none? {|word| word.match?(title) }
            errors.add(:title, "Is not allowed") # if none of the words match, don't add it to the title 
        end
    end
    

end
