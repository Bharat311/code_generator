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
    token = CodeGenerator::Generate.generate
    
    # specific length
    token = CodeGenerator::Generate.generate(length: 10)

    # unique for particular field in a model
    token = CodeGenerator::Generate.generator(uniqueness: { model: :user, field: :confirmation_code })

## Configuration

You can configure the tokens to be generated. Simply create a new code_generator.rb file in your /config/initializers folder of your rails project:

    CodeGenerator.configure do |code|
      code.length         = 6               # length of the tokens to be generated.
      code.use_chars      = :numeric        # type of token to be generated.
      code.invalid_chars  = [ 0, 1, 7 ]     # do not use these characters.
      code.valid_chars    = [ 3, 4, 5, 6 ]  # use only these characters (ignores :use_chars).
      code.include_chars  = [ "$", "%" ]    # use these characters as well (do not ignore :use_chars).
    end

You can use :alpha, :lower_alpha, :upper_alpha, :numeric, :lower_alpha_numeric, :upper_alpha_numeric, :alpha_numeric as various token types. Default is :alpha_numeric.

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