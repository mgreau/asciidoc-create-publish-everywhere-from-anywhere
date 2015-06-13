#!/bin/bash

while true; do asciidoctor -o - -T $BACKEND/slim/dzslides /documents/slides.adoc; sleep $REFRESH; done
