**FREE
Ctl-Opt NoMain Option(*SrcStmt : *NoDebugIO);

Dcl-F QSYSPRT PRINTER(132) usropn oflind(*in70);

/include 'LOGSERVICE.RPGLEINC'

// ============================================================
//  Ouvre le spool.
// ============================================================
Dcl-Proc OpenSpool export;
    Dcl-PI *N;
    End-PI;

    open QSYSPRT;

End-Proc;

// ============================================================
//  Écrit un message dans le spool.
// ============================================================
Dcl-Proc WriteLog export;
    Dcl-PI *N;
        NIVEAU CHAR(5) CONST;
        MESSAGE CHAR(512) CONST;
    End-PI;

    Dcl-DS lineOutput LEN(132) INZ;
    END-DS;

    Dcl-S Timestamp CHAR(26);

    // Génération du timestamp actuel
    Timestamp = %char(%Timestamp());

    lineOutput = %trim(Timestamp) + ' [' + %trim(NIVEAU) + '] ' + %trim(MESSAGE);
    write QSYSPRT lineOutput;

End-Proc;

// ============================================================
//  Ferme le spool.
// ============================================================
Dcl-Proc CloseSpool export;
    Dcl-PI *N;
    End-PI;

    if (%open(QSYSPRT));
        close QSYSPRT;
    endif;

End-Proc;
