# 70-instructions Processor Project
Processor project implemented based on a Von-Neumann architecture. It has:
* 4 general use registers (A,B,C,D) with 8 bits each
* A 8 bits stack pointer (SP) - max SP in 231 adress
* 2 sinalization bits (Z and C) - zero and carry
* 24 I/O adresses - from 232 to 255 in the memory

Thia processor can be divided in:
* Program Counter (PC)
* Stack Pointer (SP)
* General Use Registers (A,B,C,D)
* Aritmetric and Logic Unit (ALU)
* Instruction Register (IR)

The set of instructions supported by this processor can be found in the file **P1_1717_181.pdf**.
