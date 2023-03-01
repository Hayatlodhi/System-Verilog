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



//  Pass arguments by value
module hayat_function;
  initial begin
  int s,check_ar;
  s=3;
    $display ("s=%0d, check_ar=%0d",s, check_ar);
       check_ar= pass_arg_by_val(s);
    $display ("After calling function s=%0d, check_ar=%0d",s,check_ar);
  end
  function int pass_arg_by_val(input int x);
    x=x+9; 
    return 9*x;
  endfunction
endmodule
// output
// before calling function s=3, check_ar=0
// After calling function s=3, check_ar=108
