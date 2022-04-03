org 100h
include emu8086.inc

.data
 
;menu for user 

main_menu DB ,0dh,0ah,"-----------------------------",0dh,0ah
          DB '    "Calculator" ',0dh,0ah,0dh,0ah
          DB "1. ADDITION",0dh,0ah
          DB "2. SUBTRACTION",0dh,0ah
          DB "3. MULTIPLICATION",0dh,0ah
          DB "4. DIVISION",0dh,0ah
          DB "5. SQUARE OF A NUMBER",0dh,0ah
          DB "6. CUBE OF A NUMBER",0dh,0ah
          DB "7. CELSIUS TO FAHRENHEIT",0dh,0ah
          DB "8. FAHRENHEIT TO CELSIUS",0dh,0ah
          DB "9. EXIT",0dh,0ah
          DB "-----------------------------",0dh,0ah
          DB "Enter Your CHOICE ",'$'

;variable to display different messages 

operand         DB ,0dh,0ah,             "Enter Number ",'$'           
operand1        DB ,0dh,0ah,             "Enter First Number ",'$'
operand2        DB                       "Enter Seecod Number ",'$'
result          DB                       "Answer = ",'$'
addition        DB ,0dh,0ah,0dh,0ah,"     ADDITION",0dh,0ah,'$' 
substraction    DB ,0dh,0ah,0dh,0ah,"     SUBSTRACTION",0dh,0ah,'$'
multiplication  DB ,0dh,0ah,0dh,0ah,"     MULTIPLICATION",0dh,0ah,'$'
division        DB ,0dh,0ah,0dh,0ah,"     DIVISION",0dh,0ah,'$'
square_of_num   DB ,0dh,0ah,0dh,0ah,"     SQUARE OF A NUMBER",0dh,0ah,'$'
cube_of_num     DB ,0dh,0ah,0dh,0ah,"     CUBE OF A NUMBER",0dh,0ah,'$'
celsius_to_fahr DB ,0dh,0ah,0dh,0ah,"     CELCSIUS TO FAHRENHEIT",0dh,0ah,'$'
fahr_to_celsius DB ,0dh,0ah,0dh,0ah,"     FAHRENHEIT TO CELSIUS",0dh,0ah,'$'
 
 
;vaiables to store two input of user 

num1      dw 0
num2      dw 0         
var1      dw 5
var2      dw 9
var3      dw 32


.code
main proc  
start:
;this code will display the menu to user and take choice of user
mov ah,09h
mov dx,offset main_menu
int 21h
mov ah,1h
INT 21h
;compare choice of user and jump according to the choice    
cmp al,'1'
je call adding
cmp al,'2'
je call substracting   
cmp al,'3'
je call multiplying
cmp al,'4'
je call dividing
cmp al,'5' 
je call square
cmp al,'6'
je call cube 
cmp al,'7' 
je call celsius_to_fahrenheit
cmp al,'8'
je call fahrenheit_to_celsius
cmp al,'9'
je call exit
main endp   





; logic of a addition start from here
adding proc                 
mov ah,09h
mov dx,offset addition
int 21h
mov ah,09h
mov dx,offset operand1
int 21h
call scan_num
mov num1,cx
print 10
print 13
mov ah,09h
mov dx,offset operand2
int 21h
call scan_num     
mov num2,cx
print 10
print 13
mov ah,09h
mov dx,offset result
int 21h
mov ax,num1
add ax,num2
call print_num
jmp start
adding endp 
  
  
  
  

;logic of a substraction  start from here
substracting proc 
mov ah,09h
mov dx,offset substraction
int 21h
mov ah,09h
mov dx,offset operand1
int 21h
call scan_num
mov num1,cx
print 10
print 13
mov ah,09h
mov dx,offset operand2
int 21h
call scan_num     
mov num2,cx
print 10
print 13
mov ah,09h
mov dx,offset result
int 21h
mov ax,num1
sub ax,num2
call print_num
jmp start 
substracting endp







;logic of a multiplication start from here
multiplying proc 
mov ah,09h
mov dx,offset multiplication
int 21h
mov ah,09h
mov dx,offset operand1
int 21h
call scan_num
mov num1,cx
print 10
print 13
mov ah,09h
mov dx,offset operand2
int 21h
call scan_num     
mov num2,cx
print 10
print 13 
mov ah,09h
mov dx,offset result
int 21h
mov ax,num1
mul num2
call print_num
jmp start 
multiplying endp

   
              
              
              
              
              
   
;logic of a division start from here   

dividing proc 
mov ah,09h
mov dx,offset division
int 21h
mov ah,09h
mov dx,offset operand1
int 21h
call scan_num
mov num1,cx
print 10
print 13
mov ah,09h
mov dx,offset operand2
int 21h
call scan_num     
mov num2,cx
print 10
print 13 
mov ah,09h
mov dx,offset result
int 21h

mov ax,1
mul num1
div num2
call print_num
jmp start  
dividing endp
 
 
 
 
 

;logic of square of a number start from here

square proc
mov ah,09h
mov dx,offset square_of_num 
int 21h
mov ah,09h
mov dx,offset operand
int 21h
call scan_num
mov num1,cx
print 10
print 13 
mov ah,09h
mov dx,offset result
int 21h
mov ax,num1
mul num1
call print_num
jmp start
square endp





;logic of cube of a number start from here
cube proc 
mov ah,09h
mov dx,offset cube_of_num 
int 21h

mov ah,09h
mov dx,offset operand
int 21h
call scan_num
mov num1,cx
print 10
print 13

 
mov ah,09h
mov dx,offset result
int 21h

mov ax,num1
mul num1   
mul num1
call print_num
jmp start
cube endp





;logic of conversion from celsius to fahreheit of a number start from here
celsius_to_fahrenheit proc 
mov ah,09h
mov dx,offset celsius_to_fahr 
int 21h
mov ah,09h
mov dx,offset operand
int 21h
call scan_num
mov num1,cx
print 10
print 13 
mov ah,09h
mov dx,offset result
int 21h
;formula  F = (c *9/5)+32
mov ax,num1
mul var2
div var1
add ax,var3
call print_num
jmp start
celsius_to_fahrenheit endp 
 
 
 
 
 

;logic of from fahreheit to celsius of a number start from here
fahrenheit_to_celsius proc 
mov ah,09h
mov dx,offset fahr_to_celsius 
int 21h
mov ah,09h
mov dx,offset operand
int 21h
call scan_num
mov num1,cx
print 10
print 13 
mov ah,09h
mov dx,offset result
int 21h
;formula   c = (f-32)*5/9 
mov ax,num1
sub ax,var3
mul var1 
div var2   
call print_num
jmp start
fahrenheit_to_celsius endp






;to exit the program
exit proc 
print 10 
print 13
print "Exit Sucessfully"  
print 10 
print 13
.exit
exit endp 
 
 
 
 
 
define_print_num
define_print_num_uns
define_scan_num
end