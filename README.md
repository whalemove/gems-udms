# Udms

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'udms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install udms

## 用法

TODO: Write usage instructions here
1.从lums初始化service_endpoints,development,test环境下直接读指定文件
```ruby
Udms::ServiceEndpoint.init_service_endpoints("service_endpoint.yml")
```
2.通过key(表名)获取公共数据
```ruby
Udms::UnifiedData.get_unified_data(key)
```


## 目前支持的key
a.charge_types
b.vehicle_shapes


## Contributing

1. Fork it ( https://github.com/[my-github-username]/udms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
