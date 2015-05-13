Texas Trees API
=
![BuildStatus](https://travis-ci.org/bryanmikaelian/texas-trees-api.svg)
[![Dependency Status](https://gemnasium.com/bryanmikaelian/texas-trees-api.svg)](https://gemnasium.com/bryanmikaelian/texas-trees-api)
[![Code Climate](https://codeclimate.com/github/bryanmikaelian/texas-trees-api/badges/gpa.svg)](https://codeclimate.com/github/bryanmikaelian/texas-trees-api)

This is a simple API that allows you to view all the trees native to Texas. The data's source is from [Texas A&M](http://aggie-horticulture.tamu.edu/ornamentals/natives/INDEXSCIENTIFIC.HTM)

Running locally
=

1. ```bundle install```
2. ```bundle exec rake db:create; bundle exec rake db:schema:load; bundle exec rake db:seed```


You can then visit /trees.json and see all the data!


Contributing
=

1. Fork it
2. Open a Pull Request
2. 🚢
