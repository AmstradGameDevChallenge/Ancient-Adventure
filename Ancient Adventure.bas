1 ' Developer tool
2 ' 
3 ' little Enter + big Enter = gives you quick access to a comfy dev mode 
4 key 139,"mode 2:border 0:ink 0,0:ink 1,24:list"
5 ' 
10 '  
20 ' Ancient Adventure
30 ' by Capricornio-Uno  (miguelreinoso7@gmail.com)
40 ' July 2019
50 '
100 ' INITIALIZE
110 DEFINT a-z
120 energy=100:attack=30:defense=15
130 energyen=90:attacken=20:defenseen=10:a$=""
140 '
200 ' PRESENTATION
210 MODE 1:BORDER 0:INK 0,0:INK 1,24:PRINT"ANCIENT ADVENTURE":PRINT
220 PRINT"Press ENTER to start"
230 INPUT"",a$
240 '
300 ' PRINT GAME STATUS
310 CLS
320 PRINT"PLAYER ["energy"](a"attack")(d"defense")"
330 PRINT"ENEMY  ["energyen"](a"attacken")(d"defenseen")"
340 '
400 ' PLAYER ACTIONS
410 INPUT"ACTION";a$
420 IF a$="A" THEN energyen=energyen-attack:GOTO 500
430 IF a$="D" THEN energy=energy+defense:GOTO 500
440 GOTO 400
450 '
500 ' ENEMY ACTIONS
510 IF RND>0.25 THEN energy=energy-attacken:GOTO 300
520 energyen=energyen+defenseen:GOTO 300