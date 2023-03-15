// When A3 finishes, disable A4 but F1 should be continue.

`timescale 1ns / 1ps
module Forks;
initial begin
 fork : f1  
  #1 $display("F1");
  join_none
  t();
 end     
task t();
fork
begin:a1
#2 $display("A1");
end
begin:a2
#3 $display("A2");
end
join_none
fork
begin :a3
#4 $display("A3");
end
begin :a4
#5 $display("A4");
end
join_any
disable fork;
endtask
endmodule

// Results
# run 1000ns
A1
A2
A3
F1


// // When A3 finishes, disable F1 but A4 should be continue.
`timescale 1ns / 1ps
module Forks;
initial begin
 fork : f1  
  #10 $display("F1");
  join_none
  t();
  disable fork;
 end     
task t();
fork
begin:a1
#1 $display("A1");
end
begin:a2
#2 $display("A2");
end
join_none
fork
begin :a3
#3 $display("A3");
end
join_any
begin :a4
#4 $display("A4");
end
endtask
endmodule

// Results
# run 1000ns
A1
A2
A3
A4
