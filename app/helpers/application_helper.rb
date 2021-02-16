module ApplicationHelper
  def load_svg(name, classes, alt="Icon")
    raw('<svg role="img" aria-label="' + alt + '" class="' + classes + '" viewBox="0 0 8 8">\
      <title>' + alt + '</title>\
      <use alt="B" xlink:href="#' + name + '"></use>\
      </svg>')
  end
end
