# Place this code in a initializer. E.g: config/initializers/form_error.rb
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  model = instance_tag.object

  islabel = instance_tag.instance_of? ActionView::Helpers::Tags::Label
  ishidden = html_tag =~ /type="hidden"/
  html = if (ishidden || islabel)
    html_tag
  else
    error = ""
    Array(instance_tag.error_message).each do |i|
      error += '<p class="margin-0">'+ i.capitalize + '</p>'
    end

    '<div class="color-alert">' + html_tag + '</div>
      <div class="callout alert">' +
      error +
      '</div>'
  end

  html.html_safe
end
