# ConvertersBeforeValidation

string_converter_before_validation adds before_validation callback, which apply necessary function to attributes.

There are some derivatives: 

* squish_before_validation_for
* downcase_before_validation_for
* upcase_before_validation_for

## Usage

Let we have model Article with some fields: author_name, contact_email, title, camel_tag.

```ruby
  # app/models/article.rb
  class Article < ApplicationRecord

    validates :contact_email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Not email format" }

  end
```

Let's take fields' values from some not accurate input:

```
>> article = Article.new(author_name: '   Boss   ', contact_email: ' Boss@ExAmple.Org', title: ' hello ', camel_tag: 'hello_world')

>> article.valid?
=> false

>> article.author_name
=> '   Boss   '

>> article.contact_email
=> ' Boss@ExAmple.Org'

>> article.title
=> ' hello '

>> article.camel_tag
=> 'hello_world'

```

So, we can want to format values before save it to our base:  
  contact_email = contact_email.squish.downcase  
  author_name = author_name.squish  
  title = title.squish.upcase  
  camel_tag = camel_tag.camelcase

This gem's functions are usefull for it. They add before_validation callbacks to model and do this job for us.

```ruby
  # app/models/article.rb
  class Article < ApplicationRecord

    downcase_before_validation_for :contact_email

    squish_before_validation_for :author_name, :contact_email, :title

    upcase_before_validation_for :title

    # and another string function
    string_converter_before_validation :camelcase, :camel_tag

    validates :contact_email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Not email format" }

  end
```

```
>> article = Article.new(author_name: '   Boss   ', contact_email: ' Boss@ExAmple.Org', title: ' hello ', camel_tag: 'hello_world')

>> article.valid?
=> true

>> article.author_name
=> 'Boss'

>> article.contact_email
=> 'boss@example.org'

>> article.title
=> 'HELLO'

>> article.camel_tag
=> 'HelloWorld'

```

## Installation

Add this line to your application's Gemfile:

```ruby
  gem 'converters_before_validation'
```

And then execute:

```bash
  bundle
```

Or install it yourself as:

```bash
  gem install converters_before_validation
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
