mkdir build
zip -9 -r build/editor.love assets *.ttf main.lua conf.lua
cd build
cp ../*.lua .
rm main.lua conf.lua
cp ../../love-11.3-win64/*.dll .
cp ../*.html .
cp ../../love-11.3-win64/love.exe .
cat love.exe editor.love >> editor.exe
rm love.exe editor.love
rm ../yh10s3editor.zip
zip -9 -r ../yh10s3editor.zip .
cd ..
rm -dr build
echo Done
