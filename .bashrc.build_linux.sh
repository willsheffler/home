function buildapp {
	pd=`pwd`
	d=$2
	if [ ! $d ]; then d="."; fi
	cd $d
	g++ -o build/src/release/linux/2.6/64/x86/gcc/apps/pilot/will/$1.o -c -std=c++98 -pipe -ffor-scope -W -Wall -pedantic -Wno-long-long -O3 -ffast-math -funroll-loops -finline-functions -finline-limit=20000 -s -Wno-unused-variable -DNDEBUG -Isrc -Iexternal/include -Isrc/platform/linux/64/gcc -Isrc/platform/linux/64 -Isrc/platform/linux -Iexternal/boost_1_38_0 -I/usr/local/include -I/usr/include src/apps/pilot/will/$1.cc
	g++ -o build/src/release/linux/2.6/64/x86/gcc/$1.linuxgccrelease -Wl,-rpath=/home/sheffler/mini/build/src/release/linux/2.6/64/x86/gcc/ build/src/release/linux/2.6/64/x86/gcc/apps/pilot/will/$1.o -Llib -Lexternal/lib -Lbuild/src/release/linux/2.6/64/x86/gcc -Lsrc -L/usr/local/lib -L/usr/lib -ldevel -lprotocols -lcore.5 -lcore.4 -lcore.3 -lcore.2 -lcore.1 -lbasic -lnumeric -lutility -lObjexxFCL -lz
	cd $pd
}