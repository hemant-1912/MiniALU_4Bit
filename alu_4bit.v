`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2025 02:39:01 PM
// Design Name: 
// Module Name: alu_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//4 bit demux
module demux(
    input [1:0] sel,
    output reg e_add,
    output reg e_sub,
    output reg e_and,
    output reg e_or
);
    always @(*) begin
        e_add = 0;
        e_sub = 0;
        e_and = 0;
        e_or = 0;
        case (sel)
            2'b00: e_add = 1;
            2'b01: e_sub = 1;
            2'b10: e_and = 1;
            2'b11: e_or = 1;
        endcase
    end
endmodule

//4 bit adder
module adder(
    input [3:0] A,B,
    input en,
    output reg [3:0] sum
);
    always @(*) begin
        if (en) sum = A+B;
        else sum = 4'b0000;
    end
endmodule

//4 bit subtractor
module subtractor(
    input [3:0] A,B,
    input en,
    output reg [3:0] subtract
);
    always @(*) begin
        if (en) subtract = A-B;
        else subtract = 4'b0000;
    end
endmodule

//4 bit and operator
module andgate(
    input [3:0] A,B,
    input en,
    output reg [3:0] and_result 
);
    always @(*) begin 
        if(en) and_result = A&B;
        else and_result = 4'b0000;
    end
endmodule

// 4 bit or operator
module orgate(
    input [3:0] A,B,
    input en,
    output reg [3:0] or_result 
);
    always @(*) begin 
        if(en) or_result = A|B;
        else or_result = 4'b0000;
    end
endmodule

//top level module
module alu_4bit(
    input [3:0] A,
    input [3:0] B,
    input [1:0] opcode,
    output [3:0] result
);
    wire w_add, w_sub, w_and, w_or;
    wire [3:0] add_result, sub_result, and_result, or_result;
    demux inst_demux (
        .sel(opcode),
        .e_add(w_add),
        .e_sub(w_sub),
        .e_and(w_and),
        .e_or(w_or)
    );
    
    adder inst_adder (
        .A(A),
        .B(B),
        .en(w_add),
        .sum(add_result)
    );
    
    subtractor inst_subtract (
        .A(A),
        .B(B),
        .en(w_sub),
        .subtract(sub_result)
    );
    
    andgate inst_and (
        .A(A),
        .B(B),
        .en(w_and),
        .and_result(and_result)
    );
    
    orgate inst_or (
        .A(A),
        .B(B),
        .en(w_or),
        .or_result(or_result)
    );
    
    assign result = add_result|sub_result|and_result|or_result;
    
endmodule
