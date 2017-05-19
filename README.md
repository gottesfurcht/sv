# sv

**S**how **v**erses from different Crosswire SWORD modules line by line for comparison.

Install the required library:

    sudo pip3 install pysword

To list the bibles to compare, create a text file `config.ini` with the desired bible short codes similar to this:

``` ini
[default]
bibles = GerLut1912 ABPGRK TRA TR WHNU
```

or just specify the bible(s) on the command line:

    ./sv book chapter verse [bible 1] [bible 2] ...

For example:

    ./sv john 1 18

Results in:

    GerLut1912: Niemand hat Gott je gesehen; der eingeborene Sohn, der in des Vaters Schoß ist, der hat es uns verkündigt.
        ABPGRK: θεόν ουδείς εώρακε πώποτε ο μονογενής υιός ο ων εις τον κόλπον του πατρός εκείνος εξηγήσατο
           TRA: Θεὸν οὐδεὶς ἑώρακε πώποτε· ὁ μονογενὴς υἱὸς, ὁ ὢν εἰς τὸν κόλπον τοῦ πατρὸς, ἐκεῖνος ἐξηγήσατο.
            TR: θεον ουδεις εωρακεν πωποτε ο μονογενης υιος ο ων εις τον κολπον του πατρος εκεινος εξηγησατο
          WHNU: θεον ουδεις εωρακεν πωποτε μονογενης θεος ο ων εις τον κολπον του πατρος εκεινος εξηγησατο

And:

    ./sv john 1 18 KJV

in:

    No man hath seen God at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.
