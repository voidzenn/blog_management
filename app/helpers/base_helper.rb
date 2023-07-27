module BaseHelper
  def shortened_safe_content content, length: 400
    sanitize_data(truncate(strip_tags(content), length: length, separator: ""))
  end

  def sanitize_data data
    sanitize(data, tags: %w(p h1 h2 h3 strong em a ul ol li))
  end
end
