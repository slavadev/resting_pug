---
type: '0.1.1'
category: Chains
title: show_chain
description: Creates a chain of methods for showing a subject
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/chains.rb#L80
order: 4
---

## Description
Creates a chain of methods for showing a subject

## Tip
Override this method to add or remove methods executed while showing a subject

## Used in
- [Actions#show]({{ site.baseurl  }}/0.1.1/actions/show)

## Use
- [Subject#fetch_subject]({{ site.baseurl  }}/0.1.1/subject/fetch_subject)
- [Render#render_subject]({{ site.baseurl  }}/0.1.1/render/render_subject)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override a show chain adding logging to the end
  def show_chain
    super + [:log_showing_subject]
  end
end
```

## Source code
```ruby
# lib/resting_pug/chains.rb

def show_chain
  [:fetch_subject, :render_subject]
end
```



