#!/usr/bin/env bash

watchman -f -- trigger ./sequence-diagrams/ '*.txt' -- plantuml
