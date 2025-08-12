module CRC_detect_tb();

reg clk,reset_n,data_in,data_valid;
wire [3:0]crc_dut;
CRC_detect dut (clk,reset_n,data_in,data_valid,crc_dut);
initial begin
    clk = 0;
    forever 
        #1 clk = ~clk;
end
initial begin
    //reset_n
    reset_n = 0 ; data_valid = 1; 
    @(negedge clk);
    reset_n = 1 ;

    //insert message.
   data_in = 1 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   data_in = 1 ; @(negedge clk);
   data_in = 1 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   data_in = 1 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   data_in = 0 ; @(negedge clk);
   if (crc_dut != 4'b1010)begin
        $display("error : crc_dut =%h",crc_dut);
        $stop ;
   end
    $display("testbench is correct ^_^ ");
    $stop ;
end
endmodule