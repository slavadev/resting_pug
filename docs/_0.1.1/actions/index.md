---
type: '0.1.1'
category: Actions
title: index
description: Shows a list of subjects
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/actions.rb#L155
order: 5
---

## Description
Shows a list of subjects. <br/>
You can filter subjects by attributes using *filter* param. <br/>
You can sort subjects using *sort* param. It is a string of comma-separated attributes with minus before attributes you wants to sort descending. <br/>
You can paginate subjcts with *page* and *per_page* params.

## Example
```
Request:
GET http://your.awesome/api/books
GET http://your.awesome/api/books?filter[author]="King"
GET http://your.awesome/api/books?filter[author][]="King"&filter[author][]="Kesey"
GET http://your.awesome/api/books?sort=-id,name,-author
GET http://your.awesome/api/books?page=3&per_page=10
GET http://your.awesome/api/books?filter[author]="King"&sort=-id?page=3&per_page=10

Response:
200 OK
{
  "books": [{
    "id": 2,
    "name": "The Green Mile",
    "author": "Stephen King"
  }, {
    "id": 1,
    "name": "11/22/63",
    "author": "Stephen King"
  }]
}
```

## How to customize
- override [Params#permitted_fields_for_show]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_show) to set which params will be shown in response
- override [Params#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter) to set which params can be used for filtering
- override [Params#permitted_fields_for_sort]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_sort) to set which params can be used for sorting
- override [Params#default_sort_params]({{ site.baseurl }}/0.1.1/params/default_sort_params) to set default sort params
- override [Params#per_page_default]({{ site.baseurl }}/0.1.1/params/per_page_default) to set default per_page param
- override [Params#per_page_range]({{ site.baseurl }}/0.1.1/params/per_page_range) to set minimum and maximum possible per_page value
- override [Render#render_subjects]({{ site.baseurl }}/0.1.1/render/render_subjects) to set how subjects will be rendered
- override [Subject#subject_model]({{ site.baseurl }}/0.1.1/subject/subject_model) to set what model will be shown
- override [Chains#index_chain]({{ site.baseurl }}/0.1.1/chains/index_chain) to add or remove methods which will be called while updating a subject

## Use
- [#run_chain]({{ site.baseurl }}/0.1.1/actions/run_chain)
- [Chains#index_chain]({{ site.baseurl }}/0.1.1/chains/index_chain)

## Source code
```ruby
# lib/resting_pug/actions.rb

def index
  run_chain(index_chain)
end
```



