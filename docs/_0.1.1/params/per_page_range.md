---
type: '0.1.1'
category: Params
title: per_page_range
description: Returns a hash with minimum and maximum per_page param
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L268
order: 15
---

## Description
Returns a hash with minimum and maximum per_page param like ```{ page: 1, per_page: 10 }```

## Tip
Override [#per_page_default]({{ site.baseurl }}/0.1.1/params/per_page_default) to set default per_page param

## Used in
- [#pagination_params]({{ site.baseurl }}/0.1.1/params/pagination_params)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a per_page_range to set minimum possible value for per_page 10 and maximum 20
  def per_page_range
    { min: 10, max: 20 }
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def per_page_range
  { min: 5, max: 100 }
end
```



