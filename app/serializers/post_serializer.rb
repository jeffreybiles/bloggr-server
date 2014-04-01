class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :videoUrl, :author, :date, :body
end
