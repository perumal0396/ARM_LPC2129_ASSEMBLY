	     AREA SAMPLE,CODE,READONLY
	     ENTRY
	     MOV R1,#0X01	; move one to R1
	     MOV R2,#0X02	; move two to R2
LOOP
	     ADDS R1,R2		; R1 = R1 + R2
	     BAL LOOP		; when the CPSR register take overflow bit that time exit from the loop
	     END
