# Lite::Report

[![Gem Version](https://badge.fury.io/rb/lite-report.svg)](http://badge.fury.io/rb/lite-report)
[![Build Status](https://travis-ci.org/drexed/lite-report.svg?branch=master)](https://travis-ci.org/drexed/lite-report)

Lite::Report is a library for importing and exporting Ruby and Rails objects to flat files and
vice versa. Usage of the report module has many options so it is best if you check out the specs
to see everything the library can do.

**NOTE:** If you are coming from `ActiveReport`, please read the [port](#port) section.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-report'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-report

## Table of Contents

* [Configurations](#configurations)
* [Array](#array)
* [Hash](#hash)
* [Record](#record)
* [Exporter](#exporter)
* [Stream](#stream)
* [Port](#port)

## Configurations

`rails g lite:report:install` will generate the following file:
`../config/initalizers/lite_report.rb`

Place your default configs in this file.

```ruby
Lite::Report.configure do |config|
  config.csv_options = {}
  config.data_options = {}
  config.import_options = {}
end
```

## Array

```ruby
data = [
  ['James Jones', 39, 'male', ...],
  ['Pamela Anderson', 52, 'female', ...],
  ['Dwayne Wade', 21, 'male', ...]
]

# Convert array of arrays to CSV file
Lite::Report::Array.export(
  data,
  data_options: {
    only: ['Age', 'Sex']
  },
  csv_options: {
    write_headers: true,
    headers: ['Name', 'Age', 'Sex', ...]
  }
)

# Convert CSV file to an array of arrays
Lite::Report::Array.import(
  'path/to/file.csv',
  data_options: {
    except: ['Age', 'Sex']
  },
  csv_options: {
    return_headers: true,
    headers: ['Name', 'Age', 'Sex', ...]
  }
)
```

## Hash

```ruby
data = [
  { 'Name' => 'James Jones', 'Age' => 39, 'Sex' => 'male', ...],
  { 'Name' => 'Pamela Anderson', 'Age' => 52, 'Sex' => 'female', ...],
  { 'Name' => 'Dwayne Wade', 'Age' => 21, 'Sex' => 'male', ...]
]

# Convert array of hashes to CSV file
Lite::Report::Hash.export(
  data,
  data_options: {
    only: ['Age', 'Sex']
  },
  csv_options: {
    write_headers: true,
    headers: ['Name', 'Age', 'Sex', ...]
  }
)

# Convert CSV file to an array of hashes
Lite::Report::Hash.import(
  'path/to/file.csv',
  data_options: {
    except: ['Age', 'Sex']
  },
  csv_options: {
    return_headers: true,
    headers: ['Name', 'Age', 'Sex', ...]
  }
)
```

## Record

```ruby
data = User.where(age: 20..29)

# Convert array/relation/ransack of records to CSV file
Lite::Report::Record.export(
  data,
  data_options: {
    only: [:age, :sex]
  },
  csv_options: {
    write_headers: true,
    headers: ['Name', 'Age', 'Sex', ...]
  }
)

# Convert CSV file to an array of records (import options are from Rails `insert_all`)
Lite::Report::Record.import(
  'path/to/file.csv',
  data_options: {
    klass: User,
    except: [:age, :sex]
  },
  import_options: {
    unique_by: %w[Name Age]
  }
)
```

## Exporter

Use exporters to filter, manipulate, and prepare data before final exportation.
These are very helpful when working with complex datasets.

```ruby
class LimitedExporter < Lite::Report::Exporter

  private

  def serialize(record)
    {
      'Id' => record.id,
      'Name' => "#{record.first_name} #{record.last_name}",
      'Speed' => record.speed.ceil,
      'Date' => record.to_s(:short)
    }

    # - or -

    serializer = RecordSerializer.new(record)
    serializer.serializable_hash
  end

end

raw_data = User.where(age: 20..29)
limited_data = LimitedExporter.call(raw_data)
Lite::Report::Hash.export(limited_data)
```

## Stream

Stream is great option for preventing browser timeouts of downloading large CSV files by chunking
the results via an enumerator.

```ruby
class StreamingController < ApplicationController

  def download
    headers.delete("Content-Length")      # Tell Rack to stream the content
    headers["Cache-Control"] = "no-cache" # Don't cache anything from this generated endpoint
    headers["Content-Type"] = "text/csv"  # Tell the browser this is a CSV file
    headers["X-Accel-Buffering"] = "no"   # Don't buffer when going through proxy servers

    # Make the file download with a specific filename
    headers["Content-Disposition"] = "attachment; filename=\"example.csv\""

    self.response_body = report_body      # Set an Enumerator as the body
    response.status = 200                 # Set the status to success
  end

  private

  def report_body
    Lite::Report::Hash.export(
      data,
      csv_options: { stream: true }
    )
  end

end
```

## Port

`Lite::Report` is NOT a compatible port of [ActiveReport](https://github.com/drexed/active_report).

Please read the docs and go through the specs to view many examples.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-report. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Report project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-report/blob/master/CODE_OF_CONDUCT.md).
