---
type: '0.1.1'
category: Params
title: permitted_fields_for_filter_with_arrays
description: Returns an array with all fields that API will allow to use while filtering subjects both by single values and by array of values
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L156
order: 8
---

## Description
Returns an array with all fields that API will allow to use while filtering subjects both by single values and by array of values

## Tip
To set fields that can be used check [#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter) and [#permitted_fields_for_filter_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_arrays)

## Used in
- [#filter_params]({{ site.baseurl }}/0.1.1/params/filter_params)

## Use
- [#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter)
- [#permitted_fields_for_filter_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_arrays)

## Source code
```ruby
# lib/resting_pug/params.rb

def permitted_fields_for_filter_with_arrays
  permitted_fields_for_filter + permitted_fields_for_filter_arrays
end
```



