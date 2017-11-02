
<h1 align="center">
  <br>
  <a href="https://korolvs.github.com/resting_pug"><img src="https://korolvs.github.com/resting_pug/resting_pug.png" alt="Markdownify" width="80%"></a>
  <br>
</h1>

[![Gem Version](https://badge.fury.io/rb/resting_pug.svg)](https://badge.fury.io/rb/resting_pug)
# Basic Overview
Resting Pug allows you to create a JSON API with just adding one line to your controller and fully customize it with overriding small and simple helper methods.

## Usage
Include ```RestingPug::Base``` into controller to add CRUD actions to it:

```ruby
class BooksController < ApplicationController
  include RestingPug::Base
end
```

You can add CRUD actions to all controllers by including this module into ```ApplicationController```:

```ruby
class ApplicationController < ActionController::Base
  include RestingPug::Base
end
```

Don't forget to add a route to ```config/routes.rb``` 

```ruby
Rails.application.routes.draw do
  resources :books
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'resting_pug'
```

And then execute:
```bash
$ bundle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Logo is [Designed by Freepik](https://www.freepik.com/free-vector/happy-pug-resting-on-the-sofa_1357299.htm)
