class Sub < ActiveRecord::Base
  validates :name, :description, :moderator_id, presence: true
  validates :name, uniqueness: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

end
