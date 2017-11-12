---
type: '0.1.1'
category: Params
title: filter_params
description: Returns strong parameters which are used for filtering subjects
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L191
order: 11
---

## Description
Returns strong parameters which are used for filtering subjects

## Tip
Override [#permitted_fields_for_filter]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter) and [#permitted_fields_for_filter_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_arrays) to set allowed fields.<br/>
Get more information about [Strong parameters](http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)

## Used in
- [Modificators#filter_subjects]({{ site.baseurl }}/0.1.1/modificators/filter_subjects)

## Use
- [#permitted_fields_for_filter_with_arrays]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_filter_with_arrays)

## Source code
```ruby
# lib/resting_pug/params.rb

def filter_params
  params[:filter] ? params.require(:filter).permit(permitted_fields_for_filter_with_arrays) : nil
end
```



