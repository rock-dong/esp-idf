#
#Component Makefile
#

COMPONENT_EXTRA_CLEAN := test_tjpgd_logo.h

COMPONENT_ADD_LDFLAGS = -Wl,--whole-archive -l$(COMPONENT_NAME) -Wl,--no-whole-archive

COMPONENT_SRCDIRS := . test_vectors

include $(IDF_PATH)/make/component_common.mk

test_tjpgd.o: test_tjpgd_logo.h

test_tjpgd_logo.h: $(COMPONENT_PATH)/logo.jpg
	$(summary) XXD logo.jpg
	$(Q) cd $(COMPONENT_PATH); xxd -i logo.jpg $(COMPONENT_BUILD_DIR)/test_tjpgd_logo.h
