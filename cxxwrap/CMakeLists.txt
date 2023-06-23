cmake_minimum_required(VERSION 3.20)

set(PROJECT_NAME compas)
project(${PROJECT_NAME} LANGUAGES CXX CUDA)

execute_process(COMMAND julia -e "using CxxWrap; print(CxxWrap.prefix_path())"
                OUTPUT_VARIABLE JLlCxx_HOME)
set(JlCxx_DIR "${JLlCxx_HOME}/lib/cmake/JlCxx/")

find_package(JlCxx)
get_target_property(JlCxx_location JlCxx::cxxwrap_julia LOCATION)
get_filename_component(JlCxx_location ${JlCxx_location} DIRECTORY)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;${JlCxx_location}")

message(STATUS "Found JlCxx at ${JlCxx_location}")

file(GLOB SOURCES "${PROJECT_SOURCE_DIR}/src/*.cpp")
add_library(${PROJECT_NAME} SHARED ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC "${PROJECT_SOURCE_DIR}/include")
target_link_libraries(${PROJECT_NAME} JlCxx::cxxwrap_julia)

set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

