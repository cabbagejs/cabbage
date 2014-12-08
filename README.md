[![Stories in Ready](https://badge.waffle.io/cabbagejs/cabbage.png?label=ready&title=Ready)](https://waffle.io/cabbagejs/cabbage)
# cabbage

Cabbage is a CLI for working with simple web applications built with [Broccoli](https://github.com/broccolijs/broccoli).

It is designed to provide a conventional directory layout and extensible default build configuration. It's also striving to be as compatible with the [Lineman](http://linemanjs.com) project structure as possible.

## Installation

First, have Node.js (or io.js) and npm installed, then install the cabbage CLI:

``` sh
$ npm install -g cabbage-cli
```

## Using cabbage

To create a new project with cabbage, just change into the directory where you want the project:

``` sh
$ cabbage new my-project
```

And you should see this output:

```
Cloning a new cabbage project into 'my-project'
Installing cabbage and broccoli from npm
Your cabbage/broccoli project is ready to go! To get started:

$ cd my-project
$ cabbage run
```

To start the broccoli server, you can run `cabbage run` and visit your application at [localhost:8000](http://localhost:8000)

## Working on cabbage

To work on cabbage, you'll need a few things in place, including a working Node.js installation. Then:

```
mkdir cabbagejs
cd cabbagejs
git clone git@github.com:cabbagejs/cabbage.git
git clone git@github.com:cabbagejs/cabbage-cli.git
git clone git@github.com:cabbagejs/blueprint-simple.git

cd cabbage
npm install

cd ../cabbage-cli
npm install
npm link

cd ../blueprint-simple
npm install --save-dev broccoli
ln -s ../../cabbage node_modules/cabbage
cabbage build
tree dist
```

Then if you want to help out just pick out an issue that's been [marked ready in the waffle board](https://waffle.io/cabbagejs/cabbage).



## The name

The Broccoli vegetable we all know and love is the flowering head of a particular species of cabbage.

Broccoli.js is apparently named after its tree-based domain model and API. Because this project seeks to be a foundational wrapper around broccoli, the name cabbage seemed appropriate.
