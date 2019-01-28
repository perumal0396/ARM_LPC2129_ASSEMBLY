/******************************************/
/* Author	: PERUMAL.R               */
/* Date		: 27-jan-2019             */
/* Filename	: teq.s                   */
/* Description	: explain TEQ instruction */
/******************************************/




                AREA EOR,CODE,READONLY
		ENTRY
                MOV R2,#4                    ;R2,#4 MOVE VALUE TO R2 REGISTER

		LDR R0,=ARRAY1               ;ARRAY1 ADDRESS LOAD TO R0 REGISTER 
	        LDR R1,=ARRAY2               ;ARRAY2 ADDRESS LOAD TO R1 REGISTER
	        LDR R3,=ARRAY3               ;ARRAY3 ADDRESS LOAD TO R3 REGISTER
		
LOCK1           LDR R5,[R1],#4               ;R1 HAVE SOME ADDRESS R1 THAT ADDRESS HAVE SOME VALUE THAT VALUE LOAD T0 R5 REGISTER
                LDR R4,[R3],#4               ;R3 HAVE SOME ADDRESS R3 THAT ADDRESS HAVE SOME VALUE THAT VALUE LOAD T0 R4 REGISTER
	        TEQ R5,R4                    ;TEST IF(R5==R4) USING EX.OR GATE		
		BNE LOCK                     ;WHEN CPSR SATAUS Z = 1 SET  TAHT TIME EXIT FROM LOOP FORWARD
		
		STR R5,[R0],#4               ;R5 VALUE STORE TO R0 ADDRESS 
		SUBS R2,#1                   ;SUBTRACTION R2-1
	        BNE LOCK1                    ;WHEN CPSR SATAUS Z=1 SET THAT TIME EXIT FROM LOOP BACKWARD
		
LOCK                                         ;END OF FORWARD
L               B  L                         ;WHILE(1)or INFINITE LOOP
ARRAY2          DCD 0X11,0X11,0X11,0X11,0X10 ;ARRAY2 CONSTANT DATA
ARRAY3          DCD 0X11,0X11,0X11,0X11,0X00 ;ARRAY3 CONSTANT DATA
	        AREA SAMP,DATA,READWRITE
ARRAY1          DCD 0                        ;ARRAY1 CONSTANT DATA
	        END                          ;END OF PROGRAM
