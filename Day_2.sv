`timescale 1ns / 1ps

module counter #(parameter WIDTH=5)(
    input logic [WIDTH-1:0] data,
    input logic load,
    input logic enable,
    input logic clk,
    input logic rst_,
    output logic [WIDTH-1:0] count
    );
always_ff@(posedge clk, negedge rst_)
    begin
        if(!rst_)
        begin
            count<=0;
        end
        else if(load)
        begin
            count<=data;
        end
        else if(enable)
        begin
            count<=count+1;
        end
        else
        begin
            count<=count;
        end
    end
endmodule

