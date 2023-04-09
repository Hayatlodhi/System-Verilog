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

//Two Dimension
module multi_dim_array;
    real multi_dim[3][2]='{'{2,2},'{1,2},'{6,9}};
    initial begin
    foreach(multi_dim[i,j])
    begin
    $display("array[%0d][%0d] value is %0d",i,j,multi_dim[i][j]);
    end
    end
 endmodule
//output
array[0][0] value is 2
array[0][1] value is 2
array[1][0] value is 1
array[1][1] value is 2
array[2][0] value is 6
array[2][1] value is 9

//multi dim
module multi_dim_array;
    int multi_dim[2][3][2]='{'{'{3,2},'{4,2},'{5,1}},'{'{4,9},'{4,5},'{4,8}}};
    initial begin
    foreach(multi_dim[i,j,k])
    begin
    $display("array[%0d][%0d][%0d] value is %0d",i,j,k,multi_dim[i][j][k]);
    end
    end
endmodule


//output
array[0][0][0] value is 3
array[0][0][1] value is 2
array[0][1][0] value is 4
array[0][1][1] value is 2
array[0][2][0] value is 5
array[0][2][1] value is 1
array[1][0][0] value is 4
array[1][0][1] value is 9
array[1][1][0] value is 4
array[1][1][1] value is 5
array[1][2][0] value is 4
array[1][2][1] value is 8
