`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 21:28:16
// Design Name: 
// Module Name: mealy_overlapping
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

//sequence detector 1010 overlapping
module mealy_overlapping(
    input clk,
    input rst,
    input x,
    output z
    );
    parameter s0=3'b000;
    parameter s1=3'b001;
    parameter s2=3'b010;
    parameter s3=3'b100;
    reg [2:0]pst,nst;
    always@(posedge clk or negedge clk or rst)
    begin
    if(!rst)
    begin
    pst<=s0;
    end
    else
    pst<=nst;
    end
    
    always@(pst or x)
    begin
    case(pst)
    s0:begin
    if(x==0)
    nst=s0;
    else
    nst=s1;
    end
    s1:begin
    if(x==0)
    nst=s2;
    else
    nst=s1;
    end
    s2:begin
    if(x==0)
    nst=s0;
    else
    nst=s3;
    end
    s3:begin
    if(x==0)
    nst=s2;
    else
    nst=s1;
    end
    default:nst=s0;
    endcase
    end
    assign z=(pst==s3)?1:0;
    
    
endmodule
