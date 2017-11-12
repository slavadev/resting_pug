---
type: '0.1.1'
category: Params
title: permitted_fields_for_show
description: Returns an array with all fields that API will show
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L48
order: 2
---

## Description
Returns an array with all fields that API will show

## Tip
Override this method to add or remove fields that you don't want API to show.

## Used in
- [Render#render_subject]({{ site.baseurl }}/0.1.1/render/render_subject)
- [Render#render_subjects]({{ site.baseurl }}/0.1.1/render/render_subjects)

## Use
- [#permitted_fields]({{ site.baseurl }}/0.1.1/params/permitted_fields)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a permitted_fields_for_show method to show every permitted attribute except :title
  def permitted_fields_for_show
    permitted_fields - [:title]
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields_for_show
  permitted_fields
end
```



