1 ' Developer tool
1 ' 
1 ' little Enter and then big Enter gives you quick access to a comfy dev mode 
4 key 139,"mode 2:border 0:ink 0,0:ink 1,24:list"
1 ' 
1 '  
1 ' Ancient Adventure
1 ' by Capricornio-Uno  (miguelreinoso7@gmail.com)
1 ' July 2019
1 '
1 ' INITIALIZE
100 DEFINT a-z
110 e=100:a=30:d=15:x=5:f=0
120 ee=90:ea=20:ed=10:ex=7:en=0:a$=""
130 DIM em(3):em(0)=-1:em(1)=1:em(2)=1:em(3)=-1
140 DEF FNr(m)=m-3+(RND*6):REM rolling dice
1 '
1 ' PRESENTATION
200 MODE 1:BORDER 0:INK 0,0:INK 1,24:PRINT"ANCIENT ADVENTURE":PRINT
210 GOSUB 10000:RANDOMIZE TIME  

1 '
1 ' PRINT GAME STATUS
300 WHILE 1:CLS
310 PRINT"PLAYER ["e"](a"a")(d"d")"
320 PRINT"ENEMY  ["ee"](a"ea")(d"ed")"
330 LOCATE x,6:PRINT CHR$(249)
340 LOCATE ex,6:PRINT CHR$(225)
350 PRINT STRING$(10,143):PRINT STRING$(10,127):REM ground

1 '
1 ' PLAYER ACTIONS
400 INPUT"ACTION";a$
410 IF a$="O" or a$="o" THEN GOSUB 1000:GOTO 500
420 IF a$="P" or a$="p" THEN GOSUB 1100:GOTO 500
430 IF a$="D" or a$="d" THEN GOSUB 1400:GOTO 500
450 GOTO 400

1 ' ENEMY ACTIONS: ATTACK or MOVE
500 IF ex=x+1 THEN GOSUB 1200 ELSE GOSUB 1300

900 GOSUB 10000:WEND

1' MOVE PLAYER LEFT
1000 x=x-1:IF x=0 THEN x=1
1010 RETURN 

1' MOVE PLAYER RIGHT
1100 x=x+1:IF x=ex THEN x=x-1:f=FNr(a):ee=ee-f:PRINT"PLAYER ATTACKS WITH FORCE:"f
1110 RETURN 

1 ' ENEMY ATTACKS
1200 f=FNr(ea):e=e-f:PRINT"ENEMY ATTACKS WITH FORCE:"f
1210 RETURN

1 ' ENEMY MOVES
1300 ex=ex+em(en):en=en+1:IF en=4 THEN en=0
1310 RETURN

1 ' PLAYER DEFENDS
1400 f=FNr(d):e=e+f:PRINT"PLAYER RELOADS:"f
1410 RETURN

1 ' PRESS ENTER TO CONTINUE
10000 PRINT"PRESS ENTER TO CONTINUE"
10010 INPUT"",a$
10020 RETURN

1

