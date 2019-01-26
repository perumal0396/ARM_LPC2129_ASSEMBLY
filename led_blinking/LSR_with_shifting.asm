
   /*****************************************#
   # Author      : PERUMAL.R                 #
   # Date        : 26-jan-2019               #
   # Filename    : LSR.asm                   #
   # Description : left shift right using    #
   #                ARM                      #
   #*****************************************/



		  AREA RESET,CODE,READONLY
		  ENTRY
PINSEL    EQU 0XE002C000        ;GPIO ADDRESS
IO0DIR    EQU 0XE0028008        ;INPUT OUTPUT DIRECTION
IO0SET    EQU 0XE0028004        ;PIN SET
IO0CLR    EQU 0XE002800C        ;PIN CLEAR
IO0PIN    EQU 0XE0028000
	    
;WE NEED MAKE A ALL GPIO PIN(INPUT/OUTPUT)
	 
       	          LDR R0,=PINSEL        ;MOVE THE PINSEL ADDRESS TO R0[REGISTER]
		  LDR R1,[R0]           ;R0 VALUE STORE TO R1
		  MOV R1,#0X00000000    ;MAKE ALL BITS ALL ZERO ON R1
		  STR R1,[R0]           ;NOW ALL R0 BITS ARE ZERO(SO ALL THE PINS AS GPIO)
		
		  LDR R0,=IO0DIR        ;MOVE THE IO0DIR ADDRESS TO R0
		  LDR R1,[R0]           ;R0 VALUES LOAD TO R1
		  MOV R2,#0XFFFFFFFF    ;MAKE ALL BITS AS ZERO ON R1
		  ORR R1,R2
		  STR R1,[R0]           ; ALL R0  BITS ARE ZERO (SO ALL THE PINS AS

		  MOV R3,#0X80000000    ;PINSET(SELECT)
		  MOV R4,#0X1F          ;32(TIMES)
        		
__MAIN	;LABLE OF(LOOP)

		  LDR R0,=IO0SET        ;MOVE THE IO0DET ADDRESS TO R0
		  LDR R1,[R0]           ;R0 VALUES LOAD TO R1
                  MOV R1,R3             ;MOV R3 VLUES TO R1
		  STR R1,[R0]           ;STORE R1 TO R0 VLUES
		
		
		  LDR R0,=IO0CLR        ;MOVE THE IO0CLR ADDRESS TO R0
		  LDR R1,[R0]           ;R0 VLUES LOAD TO R1
		  MOV R1,R3             ;MOV R3 VALUES T0 R1
		  STR R1,[R0]           ;STORE R1 TO R0(VALUES)
		
		  LSR R3,#1             ;RIGHT SHIFTING
		  SUB R4,#1             ;R4 REGISTER REDUCE VALUES(R4-1) TIMES
		  BNE __MAIN            ;BRANCE NOT EQUAL(LABLE) 
LOOP              B LOOP
                  END                   ;STOP
