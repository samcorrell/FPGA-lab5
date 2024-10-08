`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:37:39 PM
// Design Name: 
// Module Name: lab5
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


module lab5(
    input [15:0]num,
    input clk,
    output [6:0]seg,
    output [3:0]an
    );
    
    wire [3:0]an_w, bcd;
    wire en;
    anode_gen uut1(clk,en,an_w);
    bcd_mux uut2(num,en,an_w,bcd);
    led_7seg uut3(clk,bcd,seg);
    assign an = ~(an_w);
endmodule






module led_7seg(
    input clk,
    input [3:0]i,
    output reg [6:0]seg
    );
    
    always @(*)
    begin
        case(i)
            0: seg = 7'b1000000;
            1: seg = 7'b1111001;
            2: seg = 7'b0100100;
            3: seg = 7'b0110000;
            4: seg = 7'b0011001;
            5: seg = 7'b0010010;
            6: seg = 7'b0000010;
            7: seg = 7'b1111000;
            8: seg = 7'b0000000;
            9: seg = 7'b0010000;
            10: seg = 7'b0000000;
            11: seg = 7'b0000000;
        endcase
    end
            
endmodule


module bcd_mux(
    input [15:0]num,
    input en,
    input [3:0]sel,
    output reg [3:0]bcd
    );
    
    
    always @(*)
    begin
    if(en) begin
        case(sel)
            4'b1000: bcd = num[15:12];
            4'b0100: bcd = num[11:8];
            4'b0010: bcd = num[7:4];
            4'b0001: bcd = num[3:0];
        endcase
    end
    end 
    
endmodule





module anode_gen(
    input clk,
    output reg en,
    output reg [3:0] an
);

     reg [7:0]count;
    initial
    begin
        an = 4'b0001;
        count = 0;
        en=1'b0;
    end
    
    
    always @(posedge clk)
    begin
        if(en)begin
        count<=count+1;
        end
        en <= 1'b1;
            
        if(count==8'd255)
        begin
          en = 1'b1;
            count<=0;                
            if(an==4'b0001)
                an<=4'b1000;
            else
                an <= an>>1;
        end
        //count<=count+1;
    end
    
endmodule
