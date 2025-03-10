`timescale 1ns/1ps

module counter_tb;
    reg clk;
    reg rst;
    reg enable;
    wire [3:0] count;
    
    // Instantiate the counter module
    counter DUT (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );
    
    // Clock generation
    always #5 clk = ~clk; // Generate a 10ns period clock
    
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        enable = 0;
        
        // Hold reset for some time
        #10 rst = 0;  // Release reset after 10ns
        
        // Enable the counter
        #10 enable = 1;
        
        // Let the counter run for enough cycles to reach 15
        #200 enable = 0; // Turn off enable after 200ns
        
        // Finish simulation
        $stop;
    end
    
    initial begin
        $monitor("Time=%0t clk=%b rst=%b enable=%b count=%b", $time, clk, rst, enable, count);
    end
    
endmodule
