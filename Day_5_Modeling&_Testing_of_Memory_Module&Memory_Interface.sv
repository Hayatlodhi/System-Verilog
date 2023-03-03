// Memory Code
module mem (
        input        clk,
	input        read,
	input        write, 
	input  logic [4:0] addr  ,
	input  logic [7:0] data_in  ,
        output logic [7:0] data_out
	   );
// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;

// SYSTEMVERILOG: logic data type
logic [7:0] memory [0:31] ;
  
  always @(posedge clk)
    if (write && !read)
// SYSTEMVERILOG: time literals
       memory[addr] <= data_in;

// SYSTEMVERILOG: always_ff and iff event control
  always_ff @(posedge clk iff ((read == '1)&&(write == '0)) )
       data_out <= memory[addr];

endmodule

// Memory TestBench
module mem_test ( input logic clk, 
                  output logic read, 
                  output logic write, 
                  output logic [4:0] addr, 
                  output logic [7:0] data_in,     // data TO memory
                  input  wire [7:0] data_out     // data FROM memory
                );
timeunit 1ns;
timeprecision 1ns;
bit     debug = 1;
logic [7:0] rdata;      // stores data read from memory for checking
  initial begin
      $timeformat ( -9, 0, " ns", 9 );
      #40000ns $display ( "MEMORY TEST TIMEOUT" );
      $finish;
    end
initial
  begin: memtest
  int error_status;
    $display("Clear Memory Test");
    for (int i = 0; i< 32; i++)
        begin
       // Write zero data to every address location
            write_mem(.address(i),.rin(0),.debug(0));
        end
    for (int i = 0; i<32; i++)
      begin 
       // Read every address location
            read_mem(.address(i),.rout(rdata),.debug(0));
       // check each memory location for data = 'h00
       #1;
       error_status= check(.address(addr),.actual(data_out),.expected(0));
      end
      if(!error_status)
      $display("verified! Each location have 0 error when data_in=0");
   // print results of test

    $display("Data = Address Test");
    for (int i = 0; i< 32; i++)
       begin 
       write_mem(.address(i),.rin(i),.debug(0));
       end
    for (int i = 0; i<32; i++)
      begin
        read_mem(.address(i),.rout(rdata),.debug(0));
        $display("Read - Address:%0d Data_out:%0d",addr,data_out);
        error_status= check(.address(addr),.actual(data_out),.expected(i));
      end
      if(!error_status)
      $display("Hayat Test Passed - No errors");;
    $finish;
  end
//write_mem tasks
task write_mem(input[4:0] address, input[7:0] rin,input debug);
//@(negedge clk)
write<=1;
read<=0;
addr <= address;
data_in<=rin;
@(negedge clk)
write<=0;
if(debug==1)
$display("Didn't have data to display");
endtask
//Task of reading memory
task read_mem(input[4:0] address, output[7:0] rout,input debug);
write<=0;
read<=1;
addr <= address;
@(negedge clk)
rout<=data_out;
read<=0;
if(debug==1)
$display("Didn't have data to display");
endtask
// function for check
function int check(input [4:0] address, input [7:0] actual, input [7:0] expected);
if(actual!==expected)
begin
$display("Error Occured at Address=%0d, Expected=%0d, but Actual=%0d",address,expected,actual);
check=check+1;
$finish;
end
endfunction
endmodule

// Top module for combining both Memory code and testbench
module top;
// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;
// SYSTEMVERILOG: logic and bit data types
bit         clk;
wire       read;
wire       write;
wire [4:0] addr;
wire [7:0] data_out;      // data_from_mem
wire [7:0] data_in;       // data_to_mem
// SYSTEMVERILOG:: implicit .* port connections
mem_test test (.*);
// SYSTEMVERILOG:: implicit .name port connections
mem memory ( .clk, .read, .write, .addr,
              .data_in, .data_out
            );
always #1 clk = ~clk;
endmodule

