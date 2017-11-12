---
type: '0.1.1'
category: Chains
title: create_chain
description: Creates a chain of methods for creating a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/chains.rb#L22
order: 1
---

## Description
Creates a chain of methods for creating a subject

## Tip
Override this method to add or remove methods executed while creating a subject

## Used in
- [Actions#create]({{ site.baseurl  }}/0.1.1/actions/create)

## Use
- [Subject#create_subject]({{ site.baseurl  }}/0.1.1/subject/create_subject)
- [Render#decide_what_to_render]({{ site.baseurl  }}/0.1.1/render/decide_what_to_render)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a create chain adding logging to the end
  def create_chain
    super + [:log_creating_subject]
  end
end
```

## Source code
```ruby
# lib/resting_pug/chains.rb

def create_chain
  [:create_subject, :decide_what_to_render]
end
```



