# travis-extra

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
```
$ travis-extra --load-env
export SOMEVAR=true EXTRA_THING=taxi
```

You can load them by running:
```
$ eval $(travis-extra --load-env)
```

## License
MIT
