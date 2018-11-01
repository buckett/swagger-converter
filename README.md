
Convert Canvas API to Valid Swagger 2 Format
============================================

The standard Canvas API swagger output doesn't validate and is for a very old version of the spec.
This attempts to convert the Canvas spec to swagger 2 which is well supported by code generation
tools.

Running
=======

This will process the swagger spec from canvas.instructure.com you can override the host by setting
the `HOST` environmental variable.

    docker build -t swagger-converter .
    docker run swagger-converter convert.sh


