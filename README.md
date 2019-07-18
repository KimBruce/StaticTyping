[![Build Status](https://travis-ci.org/pavlerohalj/staticTypes.svg?branch=master)](https://travis-ci.org/pavlerohalj/staticTypes)

Type-checking code for the Grace Programming Language from Pomona College.

## Usage

#### Prerequisites

Node.js is a prerequisite to use Grace. At the time when this document was written, version v10.15.3 was being used. 

[Node.js](https://nodejs.org)

#### Installation

To install Grace, clone the git repository mentioned below, change your directory to be the newly created staticTypes folder, and then run the chmod command as shown below:

```sh
git clone https://github.com/pavlerohalj/staticTypes.git
cd staticTypes
chmod +x install-minigrace.sh
./install-minigrace.sh
```

#### Environment variables

Open the bash_profile, and update the GRACE_MODULE_PATH to be the directory of where the staticTypes file is on your machine. 

Set `GRACE_MODULE_PATH` to `/usr/local/lib/grace/modules` and `staticTypes`

### Compiling

To compile after any changes are made to the static typing files, change your directory into the staticTypes folder and run a "make" or "make compile" command.

`make` or `make compile`

### Testing

To run all the tests at once, you can run the "make test" command in the staticTypes directory.

`make test`
