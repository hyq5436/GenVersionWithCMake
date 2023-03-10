cmake_minimum_required(VERSION 3.0.0)

message(STATUS "Resolving GIT Version")
if(GIT_EXECUTABLE)
  get_filename_component(SRC_DIR ${SRC} DIRECTORY)
  message(STATUS "git repo dir: ${SRC_DIR}")
  # Generate a git-describe version string from Git repository tags
  execute_process(
    COMMAND ${GIT_EXECUTABLE} rev-list HEAD --count
    WORKING_DIRECTORY ${SRC_DIR}
    OUTPUT_VARIABLE GIT_BUILD_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
    )
    message( STATUS "GIT Build Number: ${GIT_BUILD_VERSION}")
else()
  set(GIT_BUILD_VERSION 9999)
  message(STATUS "GIT not found, and set git build number to 9999")
endif()

configure_file(${SRC} ${DST} @ONLY)