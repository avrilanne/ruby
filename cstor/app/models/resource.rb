class Resource < ActiveRecord::Base
  has_many :likes
  belongs_to :teacher, class_name: "User"
  has_many :likers, through: :likes
  has_many :resource_tags
  has_many :tags, through: :resource_tags

  validates :title, { presence: true, uniqueness: true}
  validates :abstract, { presence: true, uniqueness: true}
  validates :url, { presence: true }

  def like_by_user(user)
    self.likes.find_by(liker_id: user.id)
  end


  def stringify_tags(tags_array)
    word = ""
    tags_array.each_with_index do |tag, index|
      if index+1 == tags_array.length
        word << tag.name
      else
        word << "#{tag.name}, "
      end
    end
    word
  end

  def arrayify_string(string, resource)
    tags = string.split(',').map! {|tag| tag.lstrip}
    tags.each do |tag|
      if Tag.find_by(name: tag)
        resource.tags << Tag.find_by(name: tag)
      else
        resource.tags << Tag.create(name: tag)
      end
    end
  end

  def viewable_by_student?
    self.teacher_only == false
  end

  def self.secret_list
    self.select{|r| r.viewable_by_student? == false}
  end
end
