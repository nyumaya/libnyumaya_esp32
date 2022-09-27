COMPONENT_ADD_INCLUDEDIRS := include/$(IDF_TARGET) \

COMPONENT_SRCDIRS := src

LIB_FILES := $(shell ls $(COMPONENT_PATH)/lib/$(IDF_TARGET)/lib*.a) \

LIBS := $(patsubst lib%.a,-l%,$(LIB_FILES))

COMPONENT_ADD_LDFLAGS +=  -L$(COMPONENT_PATH)/lib/$(IDF_TARGET) \
                          $(LIBS)
