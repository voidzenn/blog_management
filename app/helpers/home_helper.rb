module HomeHelper
  def shortened_safe_content content, length: 400
    sanitize_content(truncate(strip_tags(content), length: length, separator: ""))
  end

  private

  def sanitize_content content
    sanitize(content, tags: %w(p h1 h2 h3 strong em a ul ol li))
  end
end
