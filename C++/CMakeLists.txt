cmake_minimum_required(VERSION 2.8)
project(main CXX)

# Dependencies
#find_package(Gettext)
#find_package(wxWidgets REQUIRED)
#include(${wxWidgets_USE_FILE})

# Set compiler parameters
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -s -O3 -Wall -Wextra -Wpedantic")

# Sources
file(GLOB SRC_FILES src/*.cpp src/*.hpp)

# Compile the main executable
add_executable(${CMAKE_PROJECT_NAME} ${SRC_FILES})
#target_link_libraries(${CMAKE_PROJECT_NAME} ${wxWidgets_LIBRARIES})

# Define the 'run' target
add_custom_target(run
    COMMAND ${CMAKE_PROJECT_NAME}
    DEPENDS ${CMAKE_PROJECT_NAME}
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)
