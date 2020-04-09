# test

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/aidasan/test) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/aidasan/test) ![Docker Architectures](https://img.shields.io/badge/arch-amd64%20%7C%20arm32v7%20%7C%20arm64v8-informational)

This docker container provides a ready-to-go ruby server.

## Supported tags and respective Dockerfile links

I follow the same version naming scheme as [Ruby](https://hub.docker.com/_/ruby) themselves (At least I try to).

### Shared Tags

The following tags are support multiple architectures, e.g. `amd64`, `arm32v7` and `arm64v8`.

- `latest`
  - [`latest-amd64`, `latest-arm32v7`, `latest-arm64v8`](https://github.com/Ekristoffe/test/blob/master/Dockerfile)

## Quick reference

- **Where to file issues**:
[https://github.com/Ekristoffe/test/issues](https://github.com/Ekristoffe/test/issues)
- **Supported architectures** ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64)):
[`amd64`](https://hub.docker.com/r/amd64/ruby/), [`arm32v7`](https://hub.docker.com/r/arm32v7/ruby/), [`arm64v8`](https://hub.docker.com/r/arm64v8/ruby/)
- **Image updates**:
[PRs for Ekristoffe/test](https://github.com/Ekristoffe/test/pulls)
- **Source of this description**:
[https://github.com/Ekristoffe/test](https://github.com/Ekristoffe/test)

## What is Ruby?

From [docker hub, ruby](https://hub.docker.com/_/ruby):
>Ruby is a dynamic, reflective, object-oriented, general-purpose, open-source programming language. 
>According to its authors, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including functional, object-oriented, and imperative. 
>It also has a dynamic type system and automatic memory management.
>
>[wikipedia.org/wiki/Ruby_(programming_language)](https://en.wikipedia.org/wiki/Ruby_%28programming_language%29)


## How to use this image

Try or don't (to be defined)

```bash
docker run --rm -it -v app-data:/usr/src/app/ aidasan/test
```

## FAQ

### Any questions?

Nop

This image is also built automatically by Docker Hub whenever a new version is published on GitHUB.

## References

- tbd
