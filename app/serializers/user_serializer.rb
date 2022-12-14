# frozen_string_literal: true

class UserSerializer < BaseSerializer
  field :name
  field :email
  field :avatar do |obj|
    FileSerializer.render_as_hash(obj.avatar, view: :url_only) if obj.avatar.attached?
  end
  view :with_errors do
    association :errors, blueprint: ErrorSerializer
  end
end
