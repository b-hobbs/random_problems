Write a test for the following class

```ruby
class HtmlDocument
  def initialize(parser)
    @parser = parser
  end

  def meta_keywords
    @meta_keywords ||= begin
      tag     = @parser.get_meta_tag(:keywords)
      content = tag.attribute(:content) if tag

      content.split(',').map(&:strip) if content
    end || []
  end
end
```
