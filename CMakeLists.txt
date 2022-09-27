if(${IDF_TARGET} STREQUAL "esp32s3")
    set(COMPONENT_ADD_INCLUDEDIRS
        include/esp32s3
        )

    set(COMPONENT_REQUIRES
        tflite-lib
        esp-dsp
        )

    register_component()
    target_link_libraries(${COMPONENT_TARGET} INTERFACE "-L ${CMAKE_CURRENT_SOURCE_DIR}/lib/esp32s3")

    add_prebuilt_library(nyumaya_esp32 "${CMAKE_CURRENT_SOURCE_DIR}/lib/esp32s3/libnyumaya_esp32.a" PRIV_REQUIRES tflite-lib esp-dsp)


    target_link_libraries(${COMPONENT_TARGET} INTERFACE "-Wl,--start-group"
        nyumaya_esp32
        "-Wl,--end-group")

else()
    set(message "Error: Only esp32s3 is supported")
endif()
