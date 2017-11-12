---
type: '0.1.1'
category: Params
title: pagination_params
description: Handles pagination params and return a hash
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L249
order: 14
---

## Description
Handles pagination params and return a hash like ```{ page: 1, per_page: 10 }```

## Tip
Override [#per_page_range]({{ site.baseurl }}/0.1.1/params/per_page_range) to set minimum and maximum per_page param.<br/>
Override [#per_page_default]({{ site.baseurl }}/0.1.1/params/per_page_default) to set default per_page param.

## Used in
- [Modificators#paginate_subjects]({{ site.baseurl }}/0.1.1/modificators/paginate_subjects)

## Use
- [#per_page_range]({{ site.baseurl }}/0.1.1/params/per_page_range)
- [#per_page_default]({{ site.baseurl }}/0.1.1/params/per_page_default)

## Source code
```ruby
# lib/resting_pug/params.rb

def pagination_params
  page = params[:page].try(:to_i) || 1
  per_page = [per_page_range[:min], params[:per_page].try(:to_i) || per_page_default, per_page_range[:max]].sort[1]
  return { page: page, per_page: per_page }
end
```



