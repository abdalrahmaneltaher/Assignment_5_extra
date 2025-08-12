module rom_8x4_sync(clk,rst,addres,data_out);
    
    input clk,rst;
    input [2:0]addres ;
    
    output reg [3:0]data_out;
    
    always @(posedge clk ) begin
        if(rst)
            data_out<=0;
        else begin
            case (addres)
                0:data_out <= 4'b0001;
                1:data_out <= 4'b0010; 
                2:data_out <= 4'b0100; 
                3:data_out <= 4'b1000; 
                4:data_out <= 4'b0001; 
                5:data_out <= 4'b0010; 
                6:data_out <= 4'b0100; 
                7:data_out <= 4'b1000; 
                default: data_out <= 4'b0000;
            endcase
        end
    end
endmodule
