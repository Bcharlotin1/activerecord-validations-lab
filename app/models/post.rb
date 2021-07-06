class Post < ActiveRecord::Base
    validates :title, presence: true
    validate :non_clickbait
    validates(:content, { :length => { :minimum => 250 } })
    validates(:summary, { :length => { :maximum => 250 } })
    validates :category, inclusion: { in:["Fiction", "Non-Fiction"]}
   

    def non_clickbait
      
        if self.title
            if self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess")
            else errors.add(:title, "change the title")
            end
        end
    end 
end


