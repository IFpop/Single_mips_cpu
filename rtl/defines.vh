`define WRITEABLE 1'b1
`define UNWRITEABLE 1'b0
`define EXTENDSIGNAL_SIZE 1:0

`define RST_ENABLE 1'b0
`define RST_DISABLE 1'b1

`define ZEROWORD 32'h00000000

`define INSTRLENGTH 31:0
`define DATALENGTH 31:0
`define ADDRLENGTH 31:0
`define ALUCONTROL_SIZE 4:0
`define INSTR_INDEX 25:0

`define INSTR_MEM_NUM 131071
`define DATA_MEM_NUM 2048

`define INSTRSIZE 31:0
`define PCSIZE 31:0

`define OP_SIZE 5:0
`define R_SIZE 4:0
`define IMI_SIZE 15:0
//`define SIG_IMI_SIZE 31:0

`define ALUCONTROL_SIZE 4:0



`define REGNUM 32

// opcode
`define OP_ALL_ZERO   6'b000000

// R type   opcode  rs rt rd sa function
`define FUNC_ADD  6'b100000
`define FUNC_ADDU 6'b100001

// I type . opcode rs rt imm
`define OP_LW     6'b100011
`define OP_ORI    6'b001101
`define OP_LUI    6'b001111
`define OP_SW     6'b101011
`define OP_BEQ    6'b000100
`define OP_ADDI   6'b001000
`define OP_ADDIU  6'b001001

// J type opcode instr_index
`define OP_J      6'b000010

// ALU code
`define ALU_ADD 5'b00010
`define ALU_ADD_OVERFLOW 5'b10010
`define ALU_SUB 5'b00110
`define ALU_OR 5'b00001
`define ALU_NONE 5'b00000