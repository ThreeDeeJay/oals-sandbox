# compiler to use.
CXX = g++

# compiler compilation flags.
CXXFLAGS = -std=c++11 -Isrc -I../../vorbis/include -Ixiph/ogg/include -I../../openal-soft/include

# linker flags.
LDFLAGS = -L../../vorbis/include/lib64 -Lxiph/ogg/include/lib64 -L../../openal-soft/lib64 -lopenal32 -logg.dll -lvorbis.dll -lvorbisfile.dll

# the path to source files.
SRC_PATH = .

# the path to build files and executable.
BUILD_PATH = build

# the set of source files from the source file folder.
SRCS = $(wildcard $(SRC_PATH)/*.cpp)

# the set of object files based on the resolved source files.
OBJS = $(SRCS:$(SRC_PATH)/%.cpp=$(BUILD_PATH)/%.o)

# the rule to compile from source to object files.
$(BUILD_PATH)/%.o: $(SRC_PATH)/%.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

# the rule to compile the executable.
all: $(OBJS)
	$(CXX) -o $(BUILD_PATH)/test.exe $(OBJS) $(CXXFLAGS) $(LDFLAGS)
