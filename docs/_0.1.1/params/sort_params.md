---
type: '0.1.1'
category: Params
title: sort_params
description: Transforms a string like "-id,name" to a hash
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L203
order: 12
---

## Description
Transforms a string like "-id,name" to a hash { id: :desc, name: :asc }

## Tip
Override [#permitted_fields_for_sort]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_sort) to set allowed fields to sort.<br/>
Override [#default_sort_params]({{ site.baseurl }}/0.1.1/params/default_sort_params) to set default sort params.

## Used in
- [Modificators#sort_subjects]({{ site.baseurl }}/0.1.1/modificators/sort_subjects)

## Use
- [#permitted_fields_for_sort]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_sort)
- [#default_sort_params]({{ site.baseurl }}/0.1.1/params/default_sort_params)

## Source code
```ruby
# lib/resting_pug/params.rb

def sort_params
  sort_hash = nil
  if params[:sort]
    sort_array = params[:sort].split(',')
    sort_array = sort_array.map do |field|
      is_desc = field.split('-').count > 1
      name = field.split('-').last
      { name: name.to_sym, is_desc: is_desc }
    end
    sort_array.select! do |field|
      permitted_fields_for_sort.include? field[:name]
    end
    sort_array.each do |field|
      sort_hash ||= {}
      sort_hash[field[:name]] = field[:is_desc] ? :desc : :asc
    end
  end
  sort_hash || default_sort_params
end
```



