class Post < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:["Fiction","Non-Fiction"]}
    # validates :title, exception: {in:["True Facts"]}
    # validates :junk


    UNWANTED = [
        "Won't Believe",
        "Secret",
        "Top [number]",
        "Guess"
]


    def junk
        if self.title.include? [UNWANTED]
          self.errors.add :name, "I'm not clicking that!"
        end
    end

end