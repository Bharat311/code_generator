# CodeGenerator

Easily create unique and random tokens for your use.

## Installation

Add this line to your application's Gemfile:

    gem 'code_generator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_generator

## Usage

Really simple:

    # creating random token
    token = CodeGenerator.generate
    
    # specific length
    token = CodeGenerator.generate(length: 10)

    # unique for particular field in a model
    token = CodeGenerator.generator(uniqueness: { scope: :user, field: :confirmation_code })

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

[Jitendra Rai](https://github.com/jitendra)
[Bharat Gupta](https://github.com/Bharat311)

## License

MIT License