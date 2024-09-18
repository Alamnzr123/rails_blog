# WITHOUT USING CONCERN / DUPLICATE LOGIC

# class Comment < ApplicationRecord
#   belongs_to :article

#   VALID_STATUSES = ['public', 'private', 'archived']

#   validates :status, inclusion: {in : VALID_STATUSES}

#   def archived?
#     status == 'archived'
#   end
# end


# USING CONCERN / TO SIMPLIFY CODE

class Comment < ApplicationRecord
  include Visible

  belongs_to :article
end
