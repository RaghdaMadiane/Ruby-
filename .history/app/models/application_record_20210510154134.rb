class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def active_model_serializer
    FancyPostSerializer
  end
end
