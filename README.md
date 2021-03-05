# mars-rover

```
git clone git@github.com:daniloxaviergo/mars-rover.git
cd mars-rover
docker build . -t mars-rover

docker container run --rm -it -v "$(pwd)":/usr/src/app mars-rover bundle exec main spec/support/instructions.txt
docker container run --rm -it -v "$(pwd)":/usr/src/app mars-rover bundle exec rubocop
docker container run --rm -it -v "$(pwd)":/usr/src/app mars-rover bundle exec rspec
```
