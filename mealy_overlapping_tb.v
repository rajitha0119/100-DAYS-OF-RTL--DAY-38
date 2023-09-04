`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 22:01:30
// Design Name: 
// Module Name: mealy_overlapping_tb
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


module mealy_overlapping_tb(

    );
    reg clk,rst,x;
    wire z;
    
    mealy_overlapping uut(clk,rst,x,z);
    initial clk=0;
    always #2 clk=~clk;
    
    initial begin
    $monitor("%0t:x=%0b,z=%0b",$time,x,z);
    x=0;
    #1 rst=0;
    #2 rst=1;
    
    #3 x=0;
    #4 x=1;
    #4 x=1;
     #6 x=0;
     #6 x=1;
     #6 x=0;
     #6 x=0;
     #6 x=1;
     #6 x=1;
     end
    
    
endmodule
