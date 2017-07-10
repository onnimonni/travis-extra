# travis-extra [![Build Status](https://travis-ci.org/onnimonni/travis-extra.svg?branch=master)](https://travis-ci.org/onnimonni/travis-extra) [![Gem Version](https://badge.fury.io/rb/travis-extra.svg)](http://badge.fury.io/rb/travis-extra)

Helper script for doing more with Travis CI. It reads `.travis-extra.yml` file from current directory and exports environmental variables for your CI run.

## Features
### Add branch-specific env

This example `.travis-extra.yml`:
```yaml
env:
  branch:
    master:
      SOMEVAR=true
      EXTRA_THING=taxi
```

Will output these extra variables when `TRAVIS_BRANCH=master`.
```bash
$ travis-extra --load-env
export SOMEVAR=true EXTRA_THING=taxi
```

You can load them by running:
```bash
$ eval $(travis-extra --load-env)
```

### Specify custom config file
You can use `--file` flag to specify custom config file
```
$ travis-extra --file=config/extra.yml
```

## License
MIT
