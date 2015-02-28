# MBDumpDownloader

This gem is used to download the latest MusicBrainz database dumps from ftp://ftp.musicbrainz.org/pub/musicbrainz/data/fullexport/ which can be used to build a MusicBrainz slave database by following the instructions [here](https://github.com/metabrainz/musicbrainz-server/blob/master/INSTALL.md).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mbdump_downloader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mbdump_downloader

## Usage

Run from source with:

    $ bundle exec download_mbdumps
