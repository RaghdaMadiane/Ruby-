class ArticleSerializer < ActiveModel::Serializer
  attributes: :id ,:title ,:body
  has_many:comments
  def include_author?
    current_user.admin?
  end
end
