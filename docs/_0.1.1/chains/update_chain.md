---
type: '0.1.1'
category: Chains
title: update_chain
description: Creates a chain of methods for updating a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/chains.rb#L42
order: 2
---

## Description
Creates a chain of methods for updating a subject

## Tip
Override this method to add or remove methods executed while updating a subject

## Used in
- [Actions#update]({{ site.baseurl  }}/0.1.1/actions/update)

## Use
- [Subject#fetch_subject]({{ site.baseurl  }}/0.1.1/subject/fetch_subject)
- [Subject#update_subject]({{ site.baseurl  }}/0.1.1/subject/update_subject)
- [Render#decide_what_to_render]({{ site.baseurl  }}/0.1.1/render/decide_what_to_render)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override an update chain adding logging to the end
  def update_chain
    super + [:log_updating_subject]
  end
end
```

## Source code
```ruby
# lib/resting_pug/chains.rb

def update_chain
  [:fetch_subject, :update_subject, :decide_what_to_render]
end
```



