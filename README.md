
[![Build Status](https://travis-ci.org/KimBruce/StaticTyping.svg?branch=master)](https://travis-ci.org/KimBruce/StaticTyping)

Type-checking code for the Grace Programming Language from Pomona College.

## Usage

#### Prerequisites

Node.js is a prerequisite to use Grace. At the time when this document was written, version v10.15.3 was being used. 

[Node.js](https://nodejs.org)

#### Installation

To install Grace, clone the git repository mentioned below, change your directory to be the newly created `StaticTyping` folder, and then run the `chmod` command as shown below:

```sh
git clone https://github.com/KimBruce/StaticTyping.git
cd StaticTyping
chmod +x install-minigrace.sh
./install-minigrace.sh
```

#### Environment variables

Open the `.bash_profile`, and set the `GRACE_MODULE_PATH` to `/usr/local/lib/grace/modules` and the directory `StaticTyping` on your machine. 

### Compiling

To compile after any changes are made to the static typing files, change your directory into the `StaticTyping` folder and run a `make` or `make compile` command.

### Testing

To run all the tests at once, you can run the `make test` command in the `StaticTyping` directory.

## Implementation status

#### Unsupported features

* Dialects
* Traits
* Generic constraints
* Standard grace objects from prelude (currently hard coded)

#### Supported features

* Generics without constraints
* Subtyping
    - & and variant types using normal form
* Imports
    - Generics
    - Chained (imports of imports)

#### Details

##### Dialects

We could not figure out how to use StaticTyping dialect alongside a user-defined dialect. We tried two different approaches:
1. Create a `hasTypecheck` boolean field in `util.grace` and set it to true when `--typecheck` option is present. Then, in `compiler.grace`, if `hasTypecheck` is true, call the visitor from `StaticTyping.grace`. The issue we had with this approach is that `mgc` was not able to locate `StaticTyping.js`.
2.  Manually combine a user-defined dialect and `StaticTyping.grace` in a single `.grace` file. 

##### Subtyping optimization

We have not implemented subtyping optimization. That is, a type `Number | String | Number` should reduce to `Number | String` type, but currently does not. Our proposed changes can be found in `TODO` comment in method `|` in `ObjectTypeModule.grace`.

##### Embedded types

We have implemented a representation of embedded types, but have decided not to commit that change since the language specification does not allow types inside types. That code can be found [here](https://gist.github.com/pavlerohalj/8e79a3bf51d4b7d3852df9206221cedd). The main changes include adding `types` method to `anObjectType` and `types` parameter to `fromMethods` method in `ObjectTypeModule.grace`.