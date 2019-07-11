# Basics

Clojure is a Lisp dialect.

Java program clojure.jar reads Clojure source code and produces Java ByteCode

Java bytecode is then executed by the same JVM process already running clojure.jar

Clojure source code --- text --- > clojure.jar (compiler/Reader) ---> JVM bytecode -----> JVM (execute)

## Create new Clojure project using leiningen

`lein new app project-name`

## Run

`lein run`

## Building Clojure project

`lein uberjar`

## Running

Just need Java.

`java -jar my-program.jar`

# clojure-noob

FIXME: description

## Installation

Download from http://example.com/FIXME.

## Usage

FIXME: explanation

    $ java -jar clojure-noob-0.1.0-standalone.jar [args]

## Options

FIXME: listing of options this app accepts.

## Examples

...

### Bugs

...

### Any Other Sections
### That You Think
### Might be Useful

## License

Copyright © 2019 FIXME

This program and the accompanying materials are made available under the
terms of the Eclipse Public License 2.0 which is available at
http://www.eclipse.org/legal/epl-2.0.

This Source Code may also be made available under the following Secondary
Licenses when the conditions for such availability set forth in the Eclipse
Public License, v. 2.0 are satisfied: GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or (at your
option) any later version, with the GNU Classpath Exception which is available
at https://www.gnu.org/software/classpath/license.html.
