# CMakeList.txt : CMake project for GenerateVersionWithCMake, include source and define
# project specific logic here.
#

set(target GenerateVersionWithCMake)
# Add source to this project's executable.
add_executable (${target} "GenerateVersionWithCMake.cpp" "GenerateVersionWithCMake.h")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET GenerateVersionWithCMake PROPERTY CXX_STANDARD 20)
endif()

# TODO: Add tests and install targets if needed.

# for generated gitversion.h
target_include_directories(${target} PRIVATE ${CMAKE_BINARY_DIR})

find_package(Git)
add_custom_target(version
  ${CMAKE_COMMAND} -D SRC=${CMAKE_SOURCE_DIR}/cmake/gitversion.h.in
                   -D DST=${CMAKE_BINARY_DIR}/gitversion.h
                   -D GIT_EXECUTABLE=${GIT_EXECUTABLE}
                   -P ${CMAKE_SOURCE_DIR}/cmake/gitversion.cmake
  )
add_dependencies(${target} version)
