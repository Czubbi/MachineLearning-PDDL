# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.22.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.22.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/builds/release64

# Utility rule file for translate.

# Include any custom commands dependencies for this target.
include CMakeFiles/translate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/translate.dir/progress.make

translate: CMakeFiles/translate.dir/build.make
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying translator module into output directory"
	/opt/homebrew/Cellar/cmake/3.22.3/bin/cmake -E copy_directory /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/src/translate /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/builds/release64/bin/./translate
.PHONY : translate

# Rule to build all files generated by this target.
CMakeFiles/translate.dir/build: translate
.PHONY : CMakeFiles/translate.dir/build

CMakeFiles/translate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/translate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/translate.dir/clean

CMakeFiles/translate.dir/depend:
	cd /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/builds/release64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/src /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/src /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/builds/release64 /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/builds/release64 /Users/piotrgzubicki/Documents/School/Project2/Partial-grounding/fast-downward-partial-grounding/builds/release64/CMakeFiles/translate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/translate.dir/depend

