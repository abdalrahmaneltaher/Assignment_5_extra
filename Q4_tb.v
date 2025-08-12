module rom_8x4_sync_tb();
    
    reg clk_tb,rst_tb;
    reg [2:0]addres_tb ;
    reg  [3:0]data_out_expect;
    
    wire  [3:0]data_out_dut;
    
    rom_8x4_sync dut(clk_tb,rst_tb,addres_tb,data_out_dut);
    initial begin
        clk_tb=0;
        forever
            #1 clk_tb=~clk_tb;
    end
    initial begin
        rst_tb = 1;data_out_expect=0;
        @(negedge clk_tb);
        rst_tb =0;
        
        //read from addres 0 
        addres_tb = 0 ; data_out_expect = 4'b0001;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 1 
        addres_tb = 1 ; data_out_expect = 4'b0010;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 2
        addres_tb = 2 ; data_out_expect = 4'b0100;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 3 
        addres_tb = 3 ; data_out_expect = 4'b1000;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 4 
        addres_tb = 4 ; data_out_expect = 4'b0001;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 5 
        addres_tb = 5 ; data_out_expect = 4'b0010;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 6 
        addres_tb = 6 ; data_out_expect = 4'b0100;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        
        //read from addres 7
        addres_tb = 7 ; data_out_expect = 4'b1000;
        @(negedge clk_tb )
        if(data_out_dut != data_out_expect)begin
            $display ("error : data_out_dut = %h,data_out_expect=%h",data_out_dut,data_out_expect);
            $stop;
        end
        $display ("testbench is correct ^_^");
        $stop;

    end
endmodule
