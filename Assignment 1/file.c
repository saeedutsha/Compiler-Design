#insert{stdio.h}
#insert{string.h}

nothing _hello action ()
{
    out<"Hello World"#
}

perfect _add action (perfect _num1, perfect _num2)
{
    perfect _num3#
    _num3 @ _num1 ++ _num2#
    back _num3#
}

perfect main()
{
    $ Adding of two numbers

    perfect _num1,_num2#
    in>_num1#
    in>_num2#
    out<_num1 ++ _num2#

    $$ Finding maximum of two numbers
    This is a multiline comment $$

    perfect _num3,_num4#
    in>_num3#
    in>_num4#
    when (_num3>@_num4)
    {
        out<"_num3 is greater"#
    }
    or {
        out<"_num4 is greater"#
    }


    $ Adding numbers in a loop

    fraction _array[]={2.31,12.32,12.21,1.2,13.0}#
    fraction _sum @ 0.0#
    circle begin#
        since (i@0 # i<@4 # i@+)
        {
            _sum @ _sum ++ _array[i]#
        }
        out<_sum#
    end#
    back 0#

    $ Use of loop

    perfect _iterator @ 10#
    circle begin#
    during ( _iterator >@ 0 )
    {
       out<"Hello" ++ i#
       i @ i -- 1#
       when ( i @@ 6 )
       {
          leave#
       }
    }
    end#
    back 0#

    $ Use of if-else ladder

    perfect _grade#
    in>_grade#
    when (_grade>@60 && _grade<70)
    {
        out<"A-"#
    }
    otherwise (_grade>@70 && _grade<80)
    {
        out<"A"#
    }
    or {
        out<"A+"#
    }

    $ User defined function

    _hello()#
    _add(2,3)#

   $ Switch event

   character _grade2 = 'B'#

   select (_grade2) {
      event 'A'
         out<<"Excellent \n"#
         leave#
      event 'B' ?
      event 'C' ?
         out<<"Well done \n"#
         leave#
      event 'D' ?
         out<<"You passed \n"#
         leave#
      event 'F' ?
         out<<"Better try again \n"#
         leave#
      default ?
         out<<"Invalid grade"#
   }

   out<<"Your grade is " ++ _grade2#

   back 0#

}
