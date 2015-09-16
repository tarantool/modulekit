add_library(cfunctions SHARED cfunctions.c)
set_target_properties(cfunctions PROPERTIES PREFIX "" OUTPUT_NAME "cfunctions")

# Install module
install(FILES init.lua DESTINATION ${TARANTOOL_LUADIR}/${PROJECT_NAME}/)
install(FILES functions.lua DESTINATION ${TARANTOOL_LUADIR}/${PROJECT_NAME}/)
install(TARGETS cfunctions LIBRARY DESTINATION ${TARANTOOL_LIBDIR}/${PROJECT_NAME}/)
