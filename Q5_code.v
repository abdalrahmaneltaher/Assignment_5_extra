module CRC_detect(clk,reset_n,data_in,data_valid,crc);
    
    input clk,reset_n,data_in,data_valid;
    
    output reg [3:0]  crc;
    
    wire xor_out_1,xor_out_2;
    
    assign xor_out_1 = data_in^crc[3];
    assign xor_out_2 = crc[0]^crc[3] ; 
    
    always @(posedge clk or negedge reset_n) begin
        if(~reset_n)
            crc<=0;
        else begin
            if(data_valid) begin
                crc[0] <= xor_out_1 ;
                crc[1] <= xor_out_2 ;
                crc[2] <= crc[1];
                crc[3] <= crc[2];
            end
        end
    end
endmodule
