module ApplicationHelper

  def errors_for(model, attribute)
    content_tag :span, model.errors[attribute].first, class: 'help-block' unless model.errors[attribute].blank?
  end

  def error_class(model, attribute)
    'error' unless @recipe.errors[:title].blank?
  end

end
