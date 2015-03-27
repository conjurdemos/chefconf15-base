# foundation

This cookbook is a representation of a foundation cookbook set up with Conjur.

The Chef flow looks like this:

1. Foundation cookbook is used to build an initial image
2. Conjur identity is side-loaded at node initial
3. Application cookbook runs on top, can access secrets via Conjur

This foundation is distributed as a Docker image.

Note: `files/conjur-demo.pem` is meant to only validate inside instances
launched via demo-factory.
