class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :video_url, :author, :body, :updated_at, :created_at
end
