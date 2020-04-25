;|------------------------------------|
;|Calculating the elements of an array|
;|With numbers given by the user      |
;|And later display them on the screen|
;|------------------------------------|

Include Irvine32.inc
	INTEGER_COUNT=3
.data
	str1 BYTE "Enter a signed integer: ",0
	str2 BYTE "The sum of the integer is: ",0
	array DWORD INTEGER_COUNT DUP(0),INTEGER_COUNT DUP(1)
.code 
main PROC
;Main program control procedure. 
;Calls: Clrscr, PromptForIntegers, ArraySum, DisplaySum
	call Clrscr
	mov esi,OFFSET array
	mov ecx,INTEGER_COUNT
	call PromptForIntegers
	call ArraySum
	call DisplaySum
exit 
main ENDP
;-----------------------------------------
PromptForIntegers PROC
;Prompts the user for three integers, inserts them in an array 
;Receives: ESI points to an array of 
;doubleword integers, ECX = array size. 
;Returns: the array contains the values 
;entered by the user 
;Calls: ReadInt, WriteString
;-----------------------------------------
	mov edx,OFFSET str1
L1:
	call WriteString ;Prints from edx register
	call ReadInt ;Reads 32-bit integer and stores it in eax register
	call Crlf ;Next output line
	mov [esi],eax
	add esi,TYPE DWORD
	loop L1
	ret
PromptForIntegers ENDP
;----------------------------------------------------
ArraySum PROC
;Calculates the sum of an array of 32-bit integers. 
;Receives: ESI points to the array, ECX = array size 
;Returns:  EAX = sum of the array elements 
;----------------------------------------------------
	mov eax,00000000h
	mov esi,OFFSET array
	mov ecx,INTEGER_COUNT
L1:
	add eax,[esi]
	add esi,TYPE DWORD
	LOOP L1
ret 
ArraySum ENDP 
;----------------------------------------------------
DisplaySum PROC 
;Displays the sum on the screen 
;Recevies: EAX = the sum 
;Calls: WriteString, WriteInt 
;----------------------------------------------------
mov edx,OFFSET str2
call WriteString ;Prints from edx register
call WriteInt ;Prints the eax register
call Crlf ;Next output line

ret 
DisplaySum ENDP
END main
