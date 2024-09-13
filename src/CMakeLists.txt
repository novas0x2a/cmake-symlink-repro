CMAKE_MINIMUM_REQUIRED(VERSION 3.22)
PROJECT(HelloWorld)


FOREACH(kind IN ITEMS file in-tree-link out-tree-link)
	CONFIGURE_FILE(${kind}.c copyonly-${kind}.c COPYONLY)
	CONFIGURE_FILE(${kind}.c default-${kind}.c)
ENDFOREACH()
