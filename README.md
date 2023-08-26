# starter-snake-haskell - A Haskell Battlesnake starter

This repository contains a Haskell [Battlesnake](https://play.battlesnake.com) starter project.
It implements `v1` of the Battlesnake API and can be deployed to Heroku.

# Usage

This starter repo can be used in two different ways

1. As a fork that is subsequently modified to your needs
1. Installed as a hackage library in your haskell project

## As a fork

First clone this repo or create a fork by pushing the fork button and clone your
fork.

You can then start implementing your game logic in `app/Main.hs`.

This template uses [Stack](https://docs.haskellstack.org/en/stable/) to build
and run the project.

To start the server locally run `stack run` which will start a development
webserver on port 3000. (The port can be changed by setting the `PORT`
environment variable)

## As hackage dependency

### With cabal

Add the dependency to `your-app.cabal`

```
executable myfirstapp
    main-is: Main.hs
    build-depends:
        ...
        starter-snake-haskell ^>=1.1.0
```

### With stack

Add the dependency as `extra-dep` in your `stack.yaml`

```
resolver: lts-20.26
packages:
  - .

extra-deps:
- starter-snake-haskell-1.1.0
```

### Implementation

You can now start implementing your battlesnake logic in your project. You can
use the [Main](app/Main.hs) from this repo as a starting point.

# Deploy to Heroku

When using the repo as a fork you can use the provided [`Procfile`](Procfile) to
deploy it to heroku. Otherwise you will need to provide your own.

Afterwards you can use the [Heroku
CLI](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli) to
deploy your project.

First, login to your account:

```
heroku login -i
```

Afterwards you can create a new deployment in heroku using the [heroku-buildpack-stack](https://github.com/mfine/heroku-buildpack-stack).

```
heroku create your-battlesnake-name --buildpack https://github.com/mfine/heroku-buildpack-stack
```

You can then push your code to heroku with git where it will be build and deployed:

```
git push heroku master
```