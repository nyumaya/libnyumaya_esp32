# libnyumaya_esp32
Experimental support for nyumaya audio recognition on ESP32

Currently only ESP32S3 is supported

Dependencies:
* ESP-NN
* ESP-DSP


Steps to use your custom model the model:

The model is provided as unsigned char array. You have to
provide this array to the function addModelFromBuffer. In this
example this array is just included via marvin_model.h and
marvin_model.c as source files in the CMakeLists.txt


Limitations:

* Currently there is only support for listening to one keyword
* The library needs to allocate a 115kB memory block on the IRAM
* You need a PSRAM

The wake words are compatible with the corresponding version from
our other [repository](https://github.com/nyumaya/nyumaya_audio_recognition)
However to make them loadable without a file system they are converted using xxd.
xxd -i model.premium > model.cc
