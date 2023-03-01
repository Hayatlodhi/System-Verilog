// simple example of function 
module hayat_function;
  initial begin
  int s;
   s= sum(3,4);
    $display ("sum=%0d",s);
    #10
    s=sum(3,s);
    $display ("2nd time sum=%0d",s);
  end
  function byte sum(input int x,y);
    sum=x+y; 
  endfunction
endmodule
