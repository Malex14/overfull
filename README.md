# Overfull

This image is based on the standard Overleaf Docker image, but with the full TeX Live distribution preinstalled. This
means that you can use all the packages in TeX Live without needing to install them manually with `tlmgr`. Additionally,
the image includes Inkscape for SVG support.

## Using the Image

To use this image, install the Overleaf Toolkit as normal, and then uncomment `OVERLEAF_IMAGE_NAME` in your 
`config/overleaf.rc` file and set it to `OVERLEAF_IMAGE_NAME=ghcr.io/malex14/overfull`, and then run 
`bin/docker-compose pull` to download the new image. You can also switch back to the standard image at any time by
undoing these changes and running `bin/docker-compose pull` again.

## Updates

New versions of this image will be generated automatically whenever a new version of Overleaf is released, and will be
available at `ghcr.io/malex14/overfull`. This is managed using Tags, therefore there will most likely be no commits to
this repository when the image is updated. If you want to check when the image was last updated, you can check the [tags
of this repository](https://github.com/Malex14/overfull/tags).