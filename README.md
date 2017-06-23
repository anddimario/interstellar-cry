# interstellar-cry

An [intestellar](https://github.com/anddimario/interstellar) rewrite only for [crystal lang](https://github.com/crystal-lang/crystal) microservice

## Installation

- [install crystal](https://crystal-lang.org/docs/installation/)
- install redis
- clone the project and run: crystal deps
- then run or build

## Usage

Add the informations in redis:    
```hset interstellar:vhost host:path "STATUS TYPE COMMAND RESPONSE APIKEY"```    
where:
- status: available/maintenance, if maintenance, a maintenance message will be send
- type: job, get or post
- command: command string
- response: response content type
- apikey: api key for restricted routes (null if not enabled), example with curl: `curl http://localhost:8080/path -H "apiKey: test"` 

**Example**    
```hset interstellar:vhost:localhost:8080:/new "AVAILABLE GET /my_path/my_executable text/html null"```

**NOTE** Headers and body/querystring are passed as first and second process argv

Use this code as microservice example:
```
puts ARGV
puts ARGV[0]
puts ARGV[1]
```

## Development

...

## Benchmark
```
Intel(R) Celeron(R) CPU  N2840  @ 2.16GHz 32bits 2GB(RAM)
Ubuntu 16.04
Crystal 0.22.0
Redis 3.0.6
Siege 3.0.8
```
**NOTE** Tested with a microservice that do a select on sqlite
```
Transactions:		        8091 hits
Availability:		      100.00 %
Elapsed time:		       59.28 secs
Data transferred:	        0.10 MB
Response time:		        0.36 secs
Transaction rate:	      136.49 trans/sec
Throughput:		        0.00 MB/sec
Concurrency:		       49.81
Successful transactions:        8091
Failed transactions:	           0
Longest transaction:	        0.75
Shortest transaction:	        0.14
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/interstellar-cry/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[your-github-name]](https://github.com/[your-github-name]) Andrea Di Mario - creator, maintainer
