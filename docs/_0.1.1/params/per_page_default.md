---
type: '0.1.1'
category: Params
title: per_page_default
description: Returns a default per_page param
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L277
order: 16
---

## Description
Returns a default per_page param

## Tip
Override [#per_page_range]({{ site.baseurl }}/0.1.1/params/per_page_range) to set minimum and maximum per_page param

## Used in
- [#pagination_params]({{ site.baseurl }}/0.1.1/params/pagination_params)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a per_page_default to set default page size to 15
  def per_page_default
    15
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def per_page_default
  10
end
```



