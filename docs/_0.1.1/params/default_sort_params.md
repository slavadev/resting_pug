---
type: '0.1.1'
category: Params
title: default_sort_params
description: Returns a hash with default sorting params
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L237
order: 13
---

## Description
Returns a hash with default sorting params

## Tip
Override [#permitted_fields_for_sort]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_sort) to set allowed fields to sort.<br/>
Get more information about ActiveRecord sorting [here](http://guides.rubyonrails.org/active_record_querying.html#ordering)

## Used in
- [#sort_params]({{ site.baseurl }}/0.1.1/params/sort_params)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a default_sort_params to set default sorting to sorted descending by title
  def default_sort_params
    { title: :desc }
  end
end
```

## Source code
```ruby
# lib/resting_pug/params.rb

def default_sort_params
  {id: :desc}
end
```



