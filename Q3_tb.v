module seq_detector_tb();

reg clk_tb,rst_tb,in_tb;
wire  y_dut;
seq_detector dut (clk_tb,rst_tb,in_tb,y_dut);
//generate clock
initial begin
    clk_tb=0;
    forever 
    #1 clk_tb=~clk_tb;
end
initial begin
    rst_tb = 1;
    @(negedge clk_tb);
    rst_tb = 0 ;
    repeat (100)begin
        in_tb = $random;
        @(negedge clk_tb);
    end
    $stop;
end
endmodule
