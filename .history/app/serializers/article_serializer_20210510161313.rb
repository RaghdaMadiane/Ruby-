class ArticleSerializer < ActiveModel::Serializer
  attributes: :id ,:title ,:body
  has_many:comments
  def include_associations!
    include! :author if current_user.admin?
    include! :comments unless object.comments_disabled?
  end
end
