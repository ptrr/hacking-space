I just sort of finished my new site. Not only new code but also new CSS. I'm quite happy with it. 

<!-- INTRODUCTION STOPS HERE -->

At first I wasn't sure if I wanted to use <a href="http://rubyonrails.org" target="_blank">Ruby on Rails</a> or <a href="http://sinatrarb.com" target="_blank">Sinatra</a>. Ruby on Rails is absolutely awesome. It's very powerful and for me it's the best MVC framework out there. However, this website isn't that big and doesn't have much dynamic content or something that needs to be dredged from a database. So, I picked Sinatra for my website.

Sinatra is, according to their explanation on the website, a DSL for creating web applications with minimal effort. Well, it is true that it doesn't cost much effort and it's easily integrated with ruby gems and so forth. 

To create a simple app, just do:

``` ruby 
			# site.rb
require 'sinatra'

get '/' do
 	'Peter is awesome.'
end
```

and in terminal do:

``` bash
ruby -rubygems site.rb
```

If you now visit localhost:4567 you will see that I'm awesome. ;)