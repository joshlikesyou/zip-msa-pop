# ZIP-MSA-POP API :zap: :boom:

#### Summary
The ZIP-MSA-POP API makes use of the US Government’s HUD & Census data to derive estimated populations queried by zipcode.

#### Tech Used
- FrameWork: Ruby on Rails, I chose RoR to build this app because it's what I am most familiar with and would be able to get up and going as fast as possible. It's also fairly straight forward to build an api with it.
- Gems: rspec, pry, dotenv for development and testing.
- Hosting: I used heroku because it's pretty fast and easy to get a rails app deployed.

## Api :satellite:

Host

    https://zip-msa-pop-api.herokuapp.com

Example request

    curl https://zip-msa-pop-api.herokuapp.com/zip/90266

Successful response

    {
      "zip": 90266,
      "cbsa": 31080,
      "name": "Los Angeles-Long Beach-Anaheim, CA",
      "pop_estimate_2014": 13254397,
      "pop_estimate_2015": 13340068
    }

Failed response

    {
      "status":"error",
      "code":422,
      "message":"No zip to msa data present"
    }


The api here is super simple. The main route here is ```zip/``` and it takes a ```:zip``` parameter. The zip is passed to the ```Query::ZipMsaQuery``` class and returns a response with the related zipcode and population data or it returns an error.

##  Structure :building_construction:

The core logic of this app exists in these folders

    app/
      services/
        sync/
        query/

I chose to break out the service objects into two modules, one for querying the zip to msa population data and one for updating the database with the csvs.

The ```Query::ZipMsaQuery``` class takes an argument for the zip code, validates that it's a valid zipcode, then passes that to be queried against the database. Sql is used to query instead of active record since the conditions for joining the tables on either CBSA or the MDIV didn't seem to be easily accomplished with active record queries.

The sync module contains classes used to parse incoming data from the csv and to save that to the database. This can be called by a rake task ```rake zip_pop::sync_zip_models``` or by running the migrations which will also populate the database using the same sync. There is a class that cordinates the sync process called ```Sync::SyncModel``` which takes a config object that handles the specifics of syncing a particular model. The ```SyncModel``` gets wrapped in another class such as ```SyncZipCbsa``` and ```SyncMsa``` that handle passing the correct config object to ```SyncModel```.

##Getting the app started: :bike:

    bundle install

Run migrations:

    rake db:migarte

Run test migrations:

    rake db:migarte RAILS_ENV=test

Run tests:

    bundle exec rspec spec

Start the server:

    rails s