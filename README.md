puppetrspec
===========

Example for puppetrspec / puppet function testing and fact retrieval

* The two tests I've written are supposed to be equivalent and to pass (according to rspec official documentation).

The function is quite useless and tries to:
* retrieve a fact value
* raise an exception with fact value in the message

The two tests fails.

The first one uses the rspec's `subject.call()` syntax.
The second one uses `run.with_params()` syntax.



```
$ ./run_test.sh
ruby -c lib/puppet/parser/functions/myfunction.rb
Syntax OK
---> syntax:manifests
---> syntax:templates
---> syntax:hiera:yaml
/usr/bin/ruby -S rspec spec/functions/myfunction_spec.rb --color

myfunction
  with fact available
    shouldn't fail with call() (FAILED - 1)
    shouldn't fail with run() (FAILED - 2)

Failures:

  1) myfunction with fact available shouldn't fail with call()
     Failure/Error: expect {
       expected Puppet::ParseError with message matching /alway RAISE 'RedHat'/, got #<Puppet::ParseError: alway RAISE ''> with backtrace:
         # ./lib/puppet/parser/functions/myfunction.rb:7:in `real_function_myfunction'
         # ./spec/functions/myfunction_spec.rb:19:in `call'
         # ./spec/functions/myfunction_spec.rb:19
         # ./spec/functions/myfunction_spec.rb:18
     # ./spec/functions/myfunction_spec.rb:18

  2) myfunction with fact available shouldn't fail with run()
     Failure/Error: should run.with_params().and_raise_error(Puppet::ParseError, /alway RAISE 'RedHat'/)
     ArgumentError:
       wrong number of arguments (0 for 1)
     # ./spec/functions/myfunction_spec.rb:26

Finished in 0.09315 seconds
2 examples, 2 failures

Failed examples:

rspec ./spec/functions/myfunction_spec.rb:17 # myfunction with fact available shouldn't fail with call()
rspec ./spec/functions/myfunction_spec.rb:25 # myfunction with fact available shouldn't fail with run()
/usr/bin/ruby -S rspec spec/functions/myfunction_spec.rb --color failed
```

My software versions are `ruby 1.8.7 (2013-06-27 patchlevel 374) [x86_64-linux]`

and 

```
Using rake 10.1.1
Using CFPropertyList 2.2.8
Using addressable 2.3.6
Using archive-tar-minitar 0.5.2
Using extlib 0.9.16
Using multi_json 1.10.1
Using autoparse 0.3.3
Using json 1.8.1
Using nokogiri 1.5.11
Using aws-sdk 1.42.0
Using builder 3.2.2
Using excon 0.41.0
Using formatador 0.2.5
Using mime-types 1.25.1
Using net-ssh 2.9.1
Using net-scp 1.2.1
Using fog-core 1.25.0
Using fog-json 1.0.0
Using inflecto 0.0.2
Using fog-brightbox 0.6.1
Using ipaddress 0.8.0
Using fog 1.22.1
Using minitar 0.5.4
Using thor 0.19.1
Using blimpy 0.6.7
Using docker-api 1.15.0
Using fission 0.5.0
Using multipart-post 2.0.0
Using faraday 0.9.0
Using jwt 1.0.0
Using launchy 2.4.3
Using retriable 1.4.1
Using signet 0.5.1
Using uuidtools 2.1.5
Using google-api-client 0.7.1
Using hocon 0.0.6
Using inifile 2.0.2
Using trollop 2.0
Using rbvmomi 1.8.1
Using unf_ext 0.0.6
Using unf 0.1.4
Using beaker 1.20.1
Using rspec-core 2.99.2
Using diff-lcs 1.2.5
Using rspec-expectations 2.99.2
Using rspec-mocks 2.99.2
Using rspec 2.99.0
Using highline 1.6.21
Using rspec-its 1.0.1
Using specinfra 1.27.5
Using serverspec 1.16.0
Using beaker-rspec 3.0.0
Using coderay 1.1.0
Using deep_merge 1.0.1
Using docile 1.1.5
Using facter 2.3.0
Using json_pure 1.8.1
Using hiera 1.3.4
Using metaclass 0.0.4
Using method_source 0.8.2
Using mocha 1.1.0
Using slop 3.6.0
Using pry 0.10.1
Using puppet 3.7.3
Using puppet-lint 1.1.0
Using puppet-syntax 1.3.0
Using rspec-puppet 1.0.1
Using puppetlabs_spec_helper 0.8.2
Using simplecov-html 0.8.0
Using simplecov 0.9.1
Using bundler 1.7.6
`̀``
