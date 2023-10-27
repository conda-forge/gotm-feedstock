mkdir build
cmake -B build -S "%SRC_DIR%\gotm" -DFABM_BASE="%SRC_DIR%\fabm" -DGOTM_USE_STIM=ON -DGOTM_USE_SEAGRASS=ON -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="%PREFIX%" %CMAKE_ARGS%
if errorlevel 1 exit 1
cmake --build build --config Release --parallel %CPU_COUNT%
if errorlevel 1 exit 1
mkdir "%PREFIX%\bin"
copy build\gotm.exe "%PREFIX%\bin\"
if errorlevel 1 exit 1
rmdir /S /Q build
