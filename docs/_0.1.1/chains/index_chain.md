---
type: '0.1.1'
category: Chains
title: index_chain
description: Creates a chain of methods for showing a list of subjects
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/chains.rb#L102
order: 5
---

## Description
Creates a chain of methods for showing a list of subjects

## Tip
Override this method to add or remove methods executed while showing a list of subjects

## Used in
- [Actions#index]({{ site.baseurl  }}/0.1.1/actions/index)

## Use
- [Subject#fetch_subjects]({{ site.baseurl  }}/0.1.1/subject/fetch_subjects)
- [Modificators#filter_subjects]({{ site.baseurl  }}/0.1.1/modificators/filter_subjects)
- [Modificators#sort_subjects]({{ site.baseurl  }}/0.1.1/modificators/sort_subjects)
- [Modificators#paginate_subjects]({{ site.baseurl  }}/0.1.1/modificators/paginate_subjects)
- [Render#render_subjects]({{ site.baseurl  }}/0.1.1/render/render_subjects)

## Example
```ruby
class BooksController < ApplicationController
  include RestingPug::Base

  private
  # Override an index chain adding logging to the end
  def index_chain
    super + [:log_indexing_subjects]
  end
end
```

## Source code
```ruby
# lib/resting_pug/chains.rb

def index_chain
  [:fetch_subjects, :filter_subjects, :sort_subjects, :paginate_subjects, :render_subjects]
end
```



