# CodeGenerator

Easily create unique and random tokens for your rails project.

[![Gem Version](https://badge.fury.io/rb/code_generator.png)](http://badge.fury.io/rb/code_generator)
[![Build Status](https://travis-ci.org/Bharat311/code_generator.png?branch=master)](https://travis-ci.org/Bharat311/code_generator)
[![Code Climate](https://codeclimate.com/github/Bharat311/code_generator.png)](https://codeclimate.com/github/Bharat311/code_generator)

## Installation

Add this line to your application's Gemfile:

    gem 'code_generator', '~> 0.0.4'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_generator

## Usage

Really simple:

    # creating random token
    token = CodeGenerator::Generator.generate
    
    # specific length
    token = CodeGenerator::Generator.generate(length: 10)

    # unique for particular field in a model
    token = CodeGenerator::Generator.generate(uniqueness: { model: :user, field: :confirmation_code })

## ORM - ActiveRecord/Mongoid

When using ActiveRecord or Mongoid as your rails project ORM, it also provides you the class method tokenify! that can be used to generate random, unique tokens for the specified field.

    # ActiveRecord
    class Service < ActiveRecord::Base
      attr_accessible :auth_token
      
      tokenify!(:auth_token, length: 16)
    end

    # Mongoid
    class Service
      include Mongoid::CodeGenerator
      field :auth_token, type: String
      
      tokenify!(:auth_token, unique: true)
    end
    
In addition, you can pass the *:length (default: 10)* and *:unique (default: false)* options also.

## Configuration

You can configure the tokens to be generated. Simply create a new *'code_generator.rb'* file in the *'/config/initializers'* folder of your rails project:

    CodeGenerator.configure do |code|
      code.length         = 6               # length of the tokens to be generated. (default: 10)
      code.use_chars      = :numeric        # type of token to be generated. (default: :alpha_numeric)
      code.invalid_chars  = [ 0, 1, 7 ]     # do not use these characters. (default: none)
      code.valid_chars    = [ 3, 4, 5, 6 ]  # use only these characters (ignores :use_chars). (default: none)
      code.include_chars  = [ "$", "%" ]    # use these characters as well (does not ignore :use_chars). (default: none)
      code.repeat_chars   = false           # characters should be repeated. (default: true)
    end

You can use *:alpha (a-Z), :lower_alpha (a-z), :upper_alpha (A-Z), :numeric (0-9), :lower_alpha_numeric (a-z, 0-9), :upper_alpha_numeric (A-Z, 0-9), :alpha_numeric (a-Z, 0-9)* as various token types. Default is *:alpha_numeric*.

**Note** - These configuration settings apply to the 'tokenify!' method as well.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

* [Jitendra Rai](https://github.com/jitendra)
* [Bharat Gupta](https://github.com/Bharat311)

## License

MIT License