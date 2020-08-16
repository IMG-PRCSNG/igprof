ExternalProject_Add(libatomic_ops
    SOURCE_DIR ${libatomic_ops_source}
    INSTALL_DIR ${libatomic_ops_install}
    URL ${libatomic_ops_url}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ./configure --prefix=${libatomic_ops_install} --enable-pic
)

add_library(atomic_ops UNKNOWN IMPORTED)
set_target_properties(
    atomic_ops PROPERTIES
    IMPORTED_LOCATION "${libatomic_ops_install}/lib/libatomic_ops.a"
    INTERFACE_LINK_LIBRARIES "${libatomic_ops_install}/lib/libatomic_ops.a;${libatomic_ops_install}/lib/libatomic_ops_gpl.a"
    INTERFACE_INCLUDE_DIRECTORIES ${libatomic_ops_install}/include
    INTERFACE_COMPILE_DEFINITIONS "HAVE_ATOMIC_OPS_H"
)
add_dependencies(atomic_ops libatomic_ops)
