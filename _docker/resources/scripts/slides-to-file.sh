#!/bin/bash

for (( ; ; ))
do
  rsync -avz /documents/assets /output/
  asciidoctor --trace -o /output/slides.html -T /asciidoctor-backends/slim/dzslides /documents/slides.adoc
  sleep 2
done
