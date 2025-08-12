module detect_010_tb();

reg X_tb,clk_tb,rst_tb;

wire Y_dut;
wire [9:0] count_dut;

detect_010 dut(X_tb,clk_tb,rst_tb,Y_dut,count_dut);

//clock generation.
initial begin
    clk_tb=0;
    forever 
        #1 clk_tb = ~ clk_tb;
end
initial begin
    //reset 
    rst_tb = 1 ;
    @(negedge clk_tb);
    rst_tb = 0 ;
    //x = 0
    repeat(100)begin
        X_tb = $random;
        @(negedge clk_tb);
    end
    $stop;
end
endmodule
