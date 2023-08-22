# starter-snake-haskell - A Haskell Battlesnake starter

This repository contains a Haskell [Battlesnake](https://play.battlesnake.com) starter project.
It implements `v1` of the Battlesnake API and can be deployed to Heroku.

# Usage

This starter repo can be used in two different ways

1. Installed as a hackage library in your haskell project
1. As a fork that is subsequently modified to your needs

# Deployment

To deploy on Heroku you can use the provided `Procfile` when using the template
as a fork. Otherwise you will need to define your own `Procfile`.
Addtionally the
[heroku-buildpack-stack](https://github.com/mfine/heroku-buildpack-stack)
buildpack is required for the application to run on heroku
