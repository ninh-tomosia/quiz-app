class SubticketPdf < Prawn::Document
    def initialize(subtickets)
        super()
        @subtickets = Subticket.all
        subticket_id
    end
    def subticket_id
        #table subticket_id_all
        text  "Q 13. How do you run migration?
            (Select multi choices)
            A. rails db:migrate !!!T
            B. rake db:migrate !!!T
            C. rake db:migration
            D. rails db:migration
            Q 222) How to access console log screen in rails?
            (Select multi choices)
            A. rails console !!!T
            B/ rake c !!!T
            C. rake console --sandbox !!!T
            D. rails c --sandbox !!!T
            Q 3/ What is the purpose of using div tags in HTML?
            A. For creating
            different styles.
            B. For creating different sections. !!!T
            C. For adding headings.
            D. For adding titles."
    
      
    end
    # def subticket_id_all
    #     ["id","category"]
    # end


end
