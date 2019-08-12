# ZIP-MSA-POP CLIENT :zap: :boom:

#### Summary
The ZIP-MSA-POP Client is a gem that allows you to query the very simple yet effective api for retrieving msa populations by zipcode.

#### Tech Used
- Gems: httparty for the client and rspec, pry, webmock for development and testing.

## Structure :european_castle:

The core logic for this gem can be found here

    lib/
      zip_msa_pop.rb

This gem provides a ```ZipMsaPop::Client``` class to query the zip-pop api. The client wraps an instance of HTTParty and makes requests with that. The requests from the api are parsed, stringed keys are mapped to symbols and the response is returned to the user.

## Getting started: :bike:

- Clone the gem
- navigate to the gem directory
- then run

    $ bundle install

    $ bin/console

inside of the console you can use the class ```ZipMsaPop::Client``` with the method ```fetch_zip``` and pass it a valid zipcode such as:

    $ ZipMsaPop::Client.fetch_zip(90266)
and it will return a response from the api

_successful response_

    $ {:zip=>90266, :cbsa=>31080, :name=>"Los Angeles-Long Beach-Anaheim, CA", :pop_estimate_2014=>13254397, :pop_estimate_2015=>13340068}

_error response_

    $ {:status=>"error", :code=>422, :message=>"No zip to msa data for zipcode: 99999"}

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zip_msa_pop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zip_msa_pop
    