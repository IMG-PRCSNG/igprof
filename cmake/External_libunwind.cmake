ExternalProject_Get_Property(libatomic_ops INSTALL_DIR)
ExternalProject_Add(libunwind
    SOURCE_DIR ${libunwind_source}
    INSTALL_DIR ${libunwind_install}
    URL ${libunwind_url}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -E env CPPFLAGS=-I${INSTALL_DIR}/include CFLAGS=-g\ -O3\ -fPIC ./configure --prefix=${libunwind_install} --disable-block-signals --enable-pic
    DEPENDS libatomic_ops
)

add_library(unwind UNKNOWN IMPORTED)
set_target_properties(
    unwind PROPERTIES
    IMPORTED_LOCATION "${libunwind_install}/lib/libunwind.so"
    INTERFACE_LINK_LIBRARIES "${libunwind_install}/lib/libunwind.so;${libunwind_install}/lib/libunwind-generic.so;${libunwind_install}/lib/libunwind-ptrace.so;${libunwind_install}/lib/libunwind-coredump.so;${libunwind_install}/lib/libunwind-setjmp.so;${libunwind_install}/lib/libunwind-x86_64.so"
    INTERFACE_INCLUDE_DIRECTORIES ${libunwind_install}/include
    INTERFACE_COMPILE_DEFINITIONS "HAVE_UNWIND_H"
)
target_link_libraries(unwind INTERFACE atomic_ops)
add_dependencies(unwind libunwind)
