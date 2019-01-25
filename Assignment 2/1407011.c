import stdio.h
import math.h

perfect main()
{
    perfect a,b,c,d,e,f,g#
    perfect c#
    fraction d#

    a @ 10#
    b @ 5#
    e @ a+b#
    out e#
    f @ a*b+e#
    out f#
    x @ 20#

    when(a>b)
        a #
    or
        b #

    since ( a @ 0 # a < 10 # a ^+ )
    {
            a #
    }

    since ( a @ 10 # a > 5 # a ^- )
    {
            a #
    }


    during ( a < 7 )
    {
        a#
    }

    b @ 2#

    select(b){
      event 1 ? 4 + 2 #
         leave#
      event 2 ? 4 - 2 #
         leave#
      event 3 ? 4 * 2 #
         leave#
      event 4 ? 4 / 2 #
         leave#
      default ? 0 #
         leave#
   }

}

