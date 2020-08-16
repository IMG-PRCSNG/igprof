In this fork

- `libatomic_ops` and `libunwind` dependencies are resolved using cmake feature `ExternalProject`
- Modified docker build - Introduce `multi-stage builds` to potentially reduce build output size.
- Used `docker-compose` to define dev / test / packaging workflows.
- Utilised docker image and layer caching for speeding up CI builds.
