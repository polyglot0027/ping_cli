# Ping - CLI
A simple ping tool with background mode ability. You can get statistics, add hosts and delete hosts as well.

## Dependencies

*ruby ~> 2.4*

*bundler ~> 1.14.6*

#### Install essential gems

```
bundle
```

#### Run DB migrations

```
bundle exec rake:db migrate
```

## Launch
To launch the script, please run following commands in your CLI from the root app folder.

#### Working in background mode

```
ruby ping.rb
```

#### Working in visible mode

```
ruby main.rb
```

With this mode you can specify period of time between requests (in seconds).

```
ruby main.rb 60
```

## Commands
Let's look at some commands which you should run in CLI from root app directory.

#### Add host
```
rake hosts:add[8.8.8.8]
```
or
```
rake hosts:add[google.com]
```
#### Delete host
```
rake hosts:delete[8.8.8.8]
```
or
```
rake hosts:delete[google.com]
```
#### Get statistics for certain period of time
```
rake report['8.8.8.8','2017-05-01 23:12:20','2017-05-02 23:12:20']
```
#### Working with ActiveRecord in IRB session
```
./bin/console
```
#### Statistics format
Message body example:
```
{
  "hostname":"8.8.8.8",
  "avg_response_ms":14,
  "min_response_ms":11,
  "max_response_ms":31,
  "percent_lost_pings":75
}
```
, where:

`hostname` - hostname, IP

`avg_response_ms` - average response time in ms

`min_response_ms` - minimal response time in ms

`max_response_ms` - maximal response time in ms

`percent_lost_pings` - percent of lost packages

for determined period of time

#### Testing
To launch tests:
```
rspec spec
```
