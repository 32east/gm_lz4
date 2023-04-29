# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=releasewithsymbols_x86
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
DEFINES += -D_GLIBCXX_USE_CXX11_ABI=0 -DNDEBUG -DGMMODULE -DLZ4_SERVER -DIS_SERVERSIDE=true -DGMOD_ALLOW_OLD_TYPES -DGMOD_ALLOW_LIGHTUSERDATA -DGMOD_MODULE_NAME=\"lz4\"
INCLUDES += -I../../../source -I../../../lz4/lib -isystem ../../../../garrysmod_common/include -isystem ../../../../garrysmod_common/helpers/include
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),releasewithsymbols_x86)
TARGETDIR = x86/ReleaseWithSymbols
TARGET = $(TARGETDIR)/gmsv_lz4_linux.dll
OBJDIR = x86/ReleaseWithSymbols/intermediate/gmsv_lz4
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -Og -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -std=gnu11
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -Og -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -g -msse2 -Wall -Wextra -std=gnu++17
LIBS += ../../../../garrysmod_common/projects/linux/gmake2/x86/ReleaseWithSymbols/libhelpers.a ../../../../garrysmod_common/projects/linux/gmake2/x86/ReleaseWithSymbols/liblua_shared.a -ldl
LDDEPS += ../../../../garrysmod_common/projects/linux/gmake2/x86/ReleaseWithSymbols/libhelpers.a ../../../../garrysmod_common/projects/linux/gmake2/x86/ReleaseWithSymbols/liblua_shared.a
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -shared -Wl,-soname=gmsv_lz4_linux.dll -Wl,--no-undefined

else ifeq ($(config),release_x86)
TARGETDIR = x86/Release
TARGET = $(TARGETDIR)/gmsv_lz4_linux.dll
OBJDIR = x86/Release/intermediate/gmsv_lz4
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -flto -O3 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -msse2 -Wall -Wextra -std=gnu11
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -Wshadow -Wundef -flto -O3 -fPIC -fstrict-aliasing -Wstrict-aliasing=3 -msse2 -Wall -Wextra -std=gnu++17
LIBS += ../../../../garrysmod_common/projects/linux/gmake2/x86/Release/libhelpers.a ../../../../garrysmod_common/projects/linux/gmake2/x86/Release/liblua_shared.a -ldl
LDDEPS += ../../../../garrysmod_common/projects/linux/gmake2/x86/Release/libhelpers.a ../../../../garrysmod_common/projects/linux/gmake2/x86/Release/liblua_shared.a
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -flto -shared -Wl,-soname=gmsv_lz4_linux.dll -s -Wl,--no-undefined

endif

# Per File Configurations
# #############################################


# File sets
# #############################################

GENERATED :=
OBJECTS :=

GENERATED += $(OBJDIR)/ABICompatibility.o
GENERATED += $(OBJDIR)/main.o
OBJECTS += $(OBJDIR)/ABICompatibility.o
OBJECTS += $(OBJDIR)/main.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking gmsv_lz4
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning gmsv_lz4
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) del /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/main.o: ../../../source/main.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ABICompatibility.o: ../../../../garrysmod_common/source/ABICompatibility.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif