mkdir build
zip -9 -r build/editor.love assets *.ttf *.lua *.html
cd build
cp ../help.html .
cp ../../love-11.3-win64/*.dll .
cp ../../love-11.3-win64/love.exe .
cp ../../love-11.3-win64/license.txt .
cat love.exe editor.love >> editor.exe
rm love.exe editor.love
rm ../yh10s3editor.zip
zip -9 -r ../yh10s3editor.zip .
cd ..
rm -dr build
echo Done
