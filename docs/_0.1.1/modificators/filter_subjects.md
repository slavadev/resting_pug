---
type: '0.1.1'
category: Modificators
title: filter_subjects
description: Filters subjects using filter params
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/modificators.rb#L57
order: 3
---

## Description
Filters subjects using filter params

## Tip
Override this method to change how subjects are filtered

## Used in
- [Chains#index_chain]({{ site.baseurl  }}/0.1.1/chains/index_chain)

## Use
- [Params#filter_params]({{ site.baseurl  }}/0.1.1/params/filter_params)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a filter_subjects method to remove default scope beforehand.
  def filter_subjects
    @subjects = @subjects.unscoped.where(filter_params)
  end
end
```

## Source code
```ruby
# lib/resting_pug/modificators.rb

def filter_subjects
  @subjects = @subjects.where(filter_params)
end
```



