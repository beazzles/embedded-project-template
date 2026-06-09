add_library(project_options INTERFACE)

target_compile_features(
    project_options 
    INTERFACE
        c_std_11 
        cxx_std_20
)