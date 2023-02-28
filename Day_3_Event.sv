
// Code your testbench here
// or browse Examples
module tb;
  event hayat_event;
  initial begin 
    #10 ->hayat_event;
    $display("trigerred event at time %0t",$time);
  end
    initial begin 
      $display(" waiting for trigerred event at time %0t",$time);
      @(hayat_event);
      $display("trigerred event at time after recieving  %0t",$time);
  end
endmodule

//Output
// waiting for trigerred event at time 0
// trigerred event at time 10
// trigerred event at time after recieving  10
