FROM building5/gosu:1.10 AS gosu

FROM centos:centos6 AS dev

ARG LIBATOMIC_VERSION
ARG LIBUNWIND_VERSION

ENV LIBATOMIC_VERSION ${LIBATOMIC_VERSION}
ENV LIBUNWIND_VERSION ${LIBUNWIND_VERSION}

RUN yum update -y && \
    yum install -y \
        tar \
        make \
        gcc-c++ \
        automake \
        autoconf \
        gdb \
        pcre-devel

WORKDIR /scratch
RUN curl -sLO "https://github.com/Kitware/CMake/releases/download/v3.18.1/cmake-3.18.1-Linux-x86_64.sh" && \
    bash cmake-3.18.1-Linux-x86_64.sh --exclude-subdir --skip-license --prefix=/usr/local

COPY --from=gosu /gosu /usr/local/bin
ENTRYPOINT ["/entrypoint.sh"]

FROM dev AS build

COPY . /igprof
WORKDIR /igprof

RUN bash build.sh && make -C build -j $(nproc) install

FROM centos:centos6 as package

RUN yum update -y && \
    yum install -y \
        gcc-c++ \
        gdb \
        pcre-devel

COPY --from=gosu /gosu /usr/local/bin
COPY ./docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

COPY --from=build /igprof/build/install/ /usr
COPY --from=build /opt/ /usr/ 
RUN ln -sf /usr/lib/libigprof.so /usr/lib64/libigprof.so
RUN ln -sf /usr/lib/libunwind.so.8 /usr/lib64/libunwind.so.8

ENV LD_LIBRARY_PATH=/usr/lib:/usr/lib64:$LD_LIBRARY_PATH
