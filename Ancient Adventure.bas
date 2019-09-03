1 ' Ancient Adventure
1 ' RPG game coded by Fran Gallego in the Amstrad GameDev Challenge (AGC)
1 ' This is for study, modify, etc ...
1 ' July 2019 - 


1 ' Developer tool
1 ' 
1 ' little Enter and then big Enter gives you quick access to a comfy dev mode 
1 ' this tool is useful when working the code in the original machine
10 key 139,"mode 2:border 0:ink 0,0:ink 1,24:list"


1 ' ========== GLOSSARY ==================================
1 ' 0xBBFF: SCR INITIALIZE
1 ' 0xBB4E: TXT INITIALIZE
1 '--Index temporary variables:
1 ' i, j, k
1 '--Player Attributes:
1 ' e: energy, a: attack, d: defense
1 ' x: x-coord
1 '--Enemy Attributes (e prefix):
1 ' ee: enemy energy, ea: enemy attack
1 ' ed: enemy defense, ex: enemy x-coord
1 ' en: enemy move status, ep: enemy pen
1 '--Enemy General Control(ee prefix):
1 ' eem: Enemy Max Number
1 ' eet: Enemy turn
1 ' een: Enemy number
1 '--Movements (m enemy movement)
1 ' m: enemy movement
1 '--General Variables:
1 ' f: Temporary force calculation
1 ' a$: Temporary user INPUT
1 '--Functions:
1 ' FNr(m): Random between [m-3, m+3] REM rolling dice


1 ' ========== INITIALIZE ==================================
100 GOSUB 60000

 
1 ' ========== PRESENTATION ================================
200 MODE 1:BORDER 0:INK 0,0:INK 1,24:PRINT"ANCIENT ADVENTURE":PRINT
210 GOSUB 10000:RANDOMIZE TIME  

1 ' CREATE ENEMIES
250 GOSUB 3000:GOSUB 3000:GOSUB 3000

1 ' ========== MAIN GAME LOOP ==============================
1 ' PRINT GAME STATUS
300 WHILE 1:CLS
1 ' RENDER PLAYER
310 GOSUB 1200
1 ' RENDER ENEMIES
330 FOR eet=0TO een-1
340 GOSUB 3200
1 ' PATCH! eet=0
350 NEXT:eet=0
1 ' DRAW FLOOR
360 LOCATE 1,7:PEN 1
370 PRINT STRING$(20,143):PRINT STRING$(20,127)

1 ' PLAYER ACTIONS
400 INPUT"ACTION";a$
410 IF a$="O" or a$="o" THEN GOSUB 1000:GOTO 500
420 IF a$="P" or a$="p" THEN GOSUB 1100:GOTO 500
430 IF a$="D" or a$="d" THEN GOSUB 1400:GOTO 500
450 GOTO 400

1 ' ENEMY ACTIONS: ATTACK or MOVE
500 FOR eet=0TO een-1
510 GOSUB 3300
520 NEXT

900 GOSUB 10000
910 i=UNT(fre("")):REM resets RAM memory leak
920 WEND
1 ' ============ END OF LOOP ==============================


1' MOVE PLAYER LEFT
1000 x=x-1:IF x=0 THEN x=1
1010 RETURN 

1' MOVE PLAYER RIGHT
1100 x=x+1:IF x=ex(eet)THEN x=x-1:GOSUB 1300
1110 RETURN

1' RENDER PLAYER
1200 GOSUB 1250:PRINT"["e"](a"a")(d"d")"
1210 LOCATE x,6:GOSUB 1250
1220 RETURN

1' RENDER PLAYER CHARACTER ONLY
1250 PEN 1:PRINT CHR$(250);
1260 RETURN

1' PLAYER ATTACKS ENEMY 'eet'
1300 i=eet
1310 f=FNr(a):ee(i)=ee(i)-f
1320 GOSUB 1250:PEN 2:PRINT" >";-f"> ";:GOSUB 3250:PRINT
1330 RETURN

1' PLAYER DEFENDS
1400 f=FNr(d):e=e+f:GOSUB 1250:PEN 2:PRINT"++"f
1410 RETURN


1' ============ ENEMY ROUTINES ============================

1' CREATE NEW ENEMY

1' Is there space for new enemies?
3000 IF een=eem THEN RETURN

1' Initialize Enemy number 'een'
3010 i=een
3020 ee(i)=90:ea(i)=20:es(i)=i:ed(i)=10
3030 ex(i)=7+i*2:en(i)=0:ep(i)=i+1
3040 een=i+1
3050 RETURN

1' DESTROY ENEMY
1'     eet     een       
1'| 0 | 1 | 2 | 3 |....| eem |
3100 een=een-1:IF eet=een THEN RETURN

1' Copy enemy 'een' over enemy 'eet'
3110 i=eet:k=een
3120 ee(i)=ee(k):ea(i)=ea(k):ep(i)=ep(k)
3130 ed(i)=ed(k):ex(i)=ex(k):en(i)=en(k)
3140 es(i)=es(k)
3150 RETURN

1' DRAW ENEMY 'eet'
3200 LOCATE 1,2+eet
3210 GOSUB 3250:PRINT"["ee(eet)"](a"ea(eet)")(d"ed(eet)")"
3220 LOCATE ex(eet),5:GOSUB 3250
3230 RETURN

1' SUBROUTINE FOR DRAWING ENEMY CHARACTER WITH COLOR
3250 PRINT ton$;s$(es(eet));tof$;
3260 RETURN

1' ENEMY 'eet' UPDATE
3300 IF ee(eet)<=0THEN GOSUB 3250:PEN 3:PRINT" DEAD":GOSUB 3100

1' ENEMY ACTIONS: ATTACK or MOVE
3310 IF ex(eet)=x+1THEN GOSUB 3400 ELSE GOSUB 3500
3320 RETURN

1' ENEMY 'eet' ATTACKS


1 ' ======== PRESENTATION AND NEW GAME ==================================
1 ' PRESS ENTER TO CONTINUE
10000 PRINT"PRESS ENTER TO CONTINUE"
10010 INPUT"",a$
10020 RETURN

1 '