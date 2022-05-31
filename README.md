# Les Sans-Voix Website

## Requirements
The following tools are required:
 * `make`
 * `hugo`

## `make` Targets
 * `make clean`: delete all the files which have been produced during the other phases 
 * `make package`: generate the `build/website.tar.gz` archive file
 * `make deploy`: deploy the `build/website.tar.gz` to the `website` branch which is displayed on GitHub Pages
