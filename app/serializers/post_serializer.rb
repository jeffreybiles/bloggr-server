class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :video_url, :author, :date, :body
end
