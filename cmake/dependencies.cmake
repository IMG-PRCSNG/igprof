include(ExternalProject)

# Atomic_ops
set(libatomic_ops_source 
    "${CMAKE_CURRENT_BINARY_DIR}/libatomic_ops")
set(libatomic_ops_install 
    "${CMAKE_CURRENT_BINARY_DIR}/install")
set(libatomic_ops_url 
    "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-$ENV{LIBATOMIC_VERSION}.tar.gz")
include(cmake/External_libatomic_ops.cmake)


# Unwind
set(libunwind_source 
    "${CMAKE_CURRENT_BINARY_DIR}/libunwind")
set(libunwind_install 
    "${CMAKE_BINARY_DIR}/install")
set(libunwind_url 
    "http://download.savannah.gnu.org/releases/libunwind/libunwind-$ENV{LIBUNWIND_VERSION}.tar.gz")
include(cmake/External_libunwind.cmake)
