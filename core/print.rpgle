**FREE
Ctl-Opt NoMain Option(*SrcStmt : *NoDebugIO);
Dcl-F QSYSPRT PRINTER(132) usropn oflind(*in70);

Dcl-PR openPrinter  EXTPROC('OPENPRINTER');
End-PR;

Dcl-PR print  EXTPROC('PRINT');
    text Varchar(128) VALUE   OPTIONS(*NOPASS);
End-PR;

Dcl-PR closePrinter  EXTPROC('CLOSEPRINTER');
End-PR;

       // ============================================================
       //  Opens the printer.
       // ============================================================
Dcl-Proc openPrinter export;
    Dcl-PI *N;
    End-PI;


    open QSYSPRT;

End-Proc;
       // ============================================================
       //  Prints a message.
       // ============================================================
Dcl-Proc print export;
    Dcl-PI *N;
        text           Varchar(128) VALUE   OPTIONS(*NOPASS);
    End-PI;


    Dcl-DS lineOutput Len(132) INZ;
    End-DS;

    if (%parms() >= 1);
        lineOutput = text;
    else;
        lineOutput = '';
    endif;
    write QSYSPRT lineOutput;

End-Proc;

       // ============================================================
       //  Closes the printer.
       // ============================================================
Dcl-Proc closePrinter export;
    Dcl-PI *N;
    End-PI;

    if (%open(QSYSPRT));
        close QSYSPRT;
    endif;

End-Proc;
      