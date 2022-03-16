class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    validate :title_must_be_click_baity

    REGEX_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]


    def title_must_be_click_baity
        if REGEX_PATTERNS.none? { |p| p.match title }
            errors.add(:title, "must be clickbait-y")
        end
    end
end
