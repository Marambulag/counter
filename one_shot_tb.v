`timescale 1ns/1ps
module tb_one_shot;

    reg clk;
    reg button;
    wire button_one_shot;

    one_shot dut (
        .clk(clk),
        .button(button),
        .button_one_shot(button_one_shot)
    );
	 
	 always
	 begin
	   #1 clk = ~clk; 
	 end
	 
    initial 
	 begin
        clk = 0;
        button = 0;
        #15; 
        button = 1;
        #10; 
        button = 0;
        #10;
        button = 1;
        #10;
        button = 0;
        #20;
        $stop;
    end
 
endmodule 