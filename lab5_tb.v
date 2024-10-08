`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 02:39:45 PM
// Design Name: 
// Module Name: lab5_tb
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


module lab5_tb;
reg clk;
reg [15:0]num;
wire [6:0]seg;
wire [3:0]an;

lab5 uut(num,clk,seg,an);

initial
    clk=0;
always
begin
    clk = 1;
    #1; clk=~clk;
    #1;
end 

integer i;
initial
begin
    for(i=0;i<10;i=i+1)
    begin
        num = {12'b000000000000,i};
        #2048;
    end
    for(i=0;i<10;i=i+1)
    begin
        num = {8'b00000000,i,4'b0000};
        #2048;
    end
    for(i=0;i<10;i=i+1)
    begin
        num = {4'b0000,i,8'b00000000};
        #2048;
    end
    for(i=0;i<10;i=i+1)
    begin
        num = {i,12'b000000000000};
        #2048;
    end
    
    
    $stop;
end
endmodule
