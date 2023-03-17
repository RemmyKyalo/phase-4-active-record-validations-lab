class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion:{in:['Fiction' ,'Non-Fiction']}
    validate :clickbait_title

    private
  
    def clickbait_title
      clickbait_phrases = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
      if clickbait_phrases.none? { |phrase| title&.include?(phrase) }
        errors.add(:title, 'is not sufficiently clickbait-y')
      end
    end
    
end
