REM aof
REM SROM
copy B2AB65 044-s1.s1
copy /b 044-s1.s1+

REM MROM PROM
romcutter AD6EB8 044-m1.m1 0 20000
romcutter AD6EB8 044-p1.p1 20000 80000

REM PROM
REM romcutter AE37AF 044-p1.p1 0 80000

REM VROM
romcutter 7AB8D8 044-v2.v2 0 200000
romcutter 7AB8D8 044-v4.v4 200000 200000

REM CROM
romcutter 220C20 crom1 0 200000
romcutter 220C20 crom2 200000 200000
romcutter 37CA04 crom3 0 200000
romcutter 37CA04 crom4 200000 200000

copy /b crom1+crom3 c1c2
BSwap.exe d B c1c2 oddeven.txt 044-c1.c1 044-c2.c2
copy /b crom2+crom4 c3c4
BSwap.exe d B c3c4 oddeven.txt 044-c3.c3 044-c4.c4


REM delete
del crom1,crom2,crom3,crom4
del c1c2,c3c4

REM compress
powershell Compress-Archive 044*.* -Force -DestinationPath aof.zip

copy aof.zip romcenter