#!/bin/bash

PROJECT_NAME="$1"
SCALA_VERSION="2.9.1"
SCALATEST_VERSION="1.6.1"
MOCKITO_VERSION="1.8.5"

mkdir $PROJECT_NAME
cd $PROJECT_NAME

cat > build.sbt << EOF
name := "$PROJECT_NAME"

version := "1.0"

scalaVersion := "$SCALA_VERSION"

libraryDependencies += "org.scalatest" %% "scalatest" % "$SCALATEST_VERSION" % "test"

libraryDependencies += "org.mockito" % "mockito-core" % "$MOCKITO_VERSION" % "test"
EOF

mkdir -p "src/main/scala"
mkdir -p "src/main/resources"
mkdir -p "src/test/scala"
mkdir -p "src/test/resources"

cat > .gitignore << EOF
target/
.DS_Store
.idea
.idea_modules
EOF

git init
git add .gitignore
git add build.sbt
git commit -m 'Initial commit'

# You need to have the idea plugin in the global SBT's plugins/build.sbt
sbt update gen-idea
