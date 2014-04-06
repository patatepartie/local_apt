To recreate the debian package run, from here:
```sh
dpkg-deb --build sources
mv sources.deb binaries/test-dpkg.deb
```