---
type: '0.1.1'
category: Modificators
title: paginate_subjects
description: Selects certain page from all subjects using pagination params
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/modificators.rb#L21
order: 1
---

## Description
Selects certain page from all subjects using pagination params

## Tip
Override this method to change pagination of subjects

## Used in
- [Chains#index_chain]({{ site.baseurl  }}/0.1.1/chains/index_chain)

## Use
- [Params#pagination_params]({{ site.baseurl  }}/0.1.1/params/pagination_params)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a paginate_subjects method to use kaminari instead of will_paginate
  def paginate_subjects
    @subjects = @subjects.page(pagination_params[:page]).per(pagination_params[:per_page])
  end
end
```

## Source code
```ruby
# lib/resting_pug/modificators.rb

def paginate_subjects
  @subjects = @subjects.paginate(page: pagination_params[:page], per_page: pagination_params[:per_page])
end
```



