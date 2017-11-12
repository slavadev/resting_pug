---
type: '0.1.1'
category: Modificators
title: sort_subjects
description: Sorts subjects using sorting params
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/modificators.rb#L39
order: 2
---

## Description
Sorts subjects using sorting params

## Tip
Override this method to change sorting of subjects

## Used in
- [Chains#index_chain]({{ site.baseurl  }}/0.1.1/chains/index_chain)

## Use
- [Params#sort_params]({{ site.baseurl  }}/0.1.1/params/sort_params)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a sort_subjects method to remove default ordering beforehand.
  def sort_subjects
    @subjects = @subjects.reorder(nil).order(sort_params)
  end
end
```

## Source code
```ruby
# lib/resting_pug/modificators.rb

def sort_subjects
  @subjects = @subjects.order(sort_params)
end
```



