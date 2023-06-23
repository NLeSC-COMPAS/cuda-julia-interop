cmake_minimum_required(VERSION 3.20)

set(PROJECT_NAME compas)
project(${PROJECT_NAME} LANGUAGES CXX CUDA)

file(GLOB SOURCES "${PROJECT_SOURCE_DIR}/src/*.cpp")
add_library(${PROJECT_NAME} SHARED ${SOURCES})
target_include_directories(${PROJECT_NAME} PUBLIC "${PROJECT_SOURCE_DIR}/include")

set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

