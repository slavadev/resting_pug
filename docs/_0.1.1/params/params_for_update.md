---
type: '0.1.1'
category: Params
title: params_for_update
description: Returns strong parameters which are used in updating action
github: https://github.com/korolvs/resting_pug/blob/master/lib/resting_pug/params.rb#L180
order: 10
---

## Description
Returns strong parameters which are used in updating action

## Tip
Override [#permitted_fields_for_update]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_update) to set allowed fields.<br/>
Override [Subject#subject_model_sym]({{ site.baseurl }}/0.1.1/subject/subject_model_sym) to change the root attrubute of params.<br/>
Get more information about [Strong parameters](http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters)

## Used in
- [Subject#update_subject]({{ site.baseurl }}/0.1.1/subject/update_subject)

## Use
- [Subject#subject_model_sym]({{ site.baseurl }}/0.1.1/subject/subject_model_sym)
- [#permitted_fields_for_update]({{ site.baseurl }}/0.1.1/params/permitted_fields_for_update)

## Source code
```ruby
# lib/resting_pug/params.rb

def params_for_update
  params.require(subject_model_sym).permit(permitted_fields_for_update)
end
```



