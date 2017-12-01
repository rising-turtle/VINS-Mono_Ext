include_directories( ${CMAKE_CURRENT_SOURCE_DIR} )


# ADD all sources files
set( freak_SRCS
    freak.cpp
)

# Static version
add_library( freak_p STATIC ${freak_SRCS} )
target_link_libraries( freak_p ${OpenCV_LIBS} )

#########
# Shared library

# Set public header
set( freak_HDRS
    freak.h
    hammingseg.h
)

add_library( freak SHARED ${freak_SRCS} ${freak_HDRS} )
target_link_libraries( freak ${OpenCV_LIBS} )
