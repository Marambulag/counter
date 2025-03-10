`timescale 1ns/1ps

module clkdiv_tb;
    reg clk;
    reg rst;
    wire clk_div;
    
    // Instantiate the clkdiv module
    clkdiv DUT (
        .clk(clk),
        .rst(rst),
        .clk_div(clk_div)
    );
    
    // Clock generation: 10ns period (100 MHz clock)
    always #5 clk = ~clk;  
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        
        // Hold reset for some time
        #20 rst = 0;  
        
        // Let it run for some time
        #20000; // Run for enough cycles to see clk_div toggle
        
        // Finish simulation
        $stop;
    end
    
    initial begin
        $monitor("Time=%0t clk=%b rst=%b clk_div=%b", $time, clk, rst, clk_div);
    end
endmodule
