---
type: '0.1.1'
category: Chains
title: destroy_chain
description: Creates a chain of methods for deleting a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/chains.rb#L61
order: 3
---

## Description
Creates a chain of methods for deleting a subject

## Tip
Override this method to add or remove methods executed while deleting a subject

## Used in
- [Actions#destroy]({{ site.baseurl  }}/0.1.1/actions/destroy)

## Use
- [Subject#fetch_subject]({{ site.baseurl  }}/0.1.1/subject/fetch_subject)
- [Subject#destroy_subject]({{ site.baseurl  }}/0.1.1/subject/destroy_subject)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a destroy chain adding logging to the end
  def destroy_chain
    super + [:log_destroying_subject]
  end
end
```

## Source code
```ruby
# lib/resting_pug/chains.rb

def destroy_chain
  [:fetch_subject, :destroy_subject]
end
```



