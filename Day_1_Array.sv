//19 Feb 2023
//Single Dimension Array
// declaration of array 
module Array;
int a[3]='{5.4,4,6}; //declaring
initial begin
foreach(a[i])
begin
$display("array[%0d] value is %0d",i,a[i]);
end
end
endmodule
//output
array[0] value is 5
array[1] value is 4
array[2] value is 6
// here it is giving value in decimal, to get value in fraction we will write write "real" instead of "int"

module Array;
real a[3]='{5.4444,4,6}; //declaring
initial begin
foreach(a[i])
begin
$display("array[%0d] value is %1.2f",i,a[i]);
end
end
endmodule

//output
array[0] value is 5.44
array[1] value is 4.00
array[2] value is 6.00
