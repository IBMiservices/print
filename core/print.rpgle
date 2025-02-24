**FREE
Ctl-Opt NoMain Option(*SrcStmt : *NoDebugIO);

Dcl-F QSYSPRT PRINTER(132) usropn oflind(overflow);

/include 'PRINT.RPGLEINC'

// // ============================================================
// //  Set up test suite. Executed once per RUCALLTST.
// // ============================================================
Dcl-proc setUpSpool export;
Dcl-pi *n;
    spoolAInitialiser likeds(Spool);
end-pi;

// Dcl-s rc Char(1);

runCmd('OVRPRTF FILE(QSYSPRT) TOFILE(*FILE) +
                 SPLFNAME(' + %trim(spoolAInitialiser.spoolName) + ') OVRSCOPE(*JOB)');
// monitor;
//     openPrinter();
//     print('Executing:   setUpWSpool()');
// on-error;
//     // ignore errors ...
//     // ... but try to remove the override.
//     monitor;
//         runCmd('DLTOVR FILE(QSYSPRT) LVL(*JOB)');
//     on-error;
//         dsply '*** Failed to delete QSYSPRT override! ***' rc;
//     endmon;
// endmon;

End-Proc;

// ============================================================
//  Ouvre le spool.
// ============================================================
// Dcl-Proc OpenSpool export;
// Dcl-PI *N;
// End-PI;

//     open QSYSPRT;

// End-Proc;

// ============================================================
//  Écrit un message dans le spool.
// ============================================================
// Dcl-Proc WRITESPOOL export;
// Dcl-PI *N;
//     MESSAGE CHAR(132) CONST;
// End-PI;

// Dcl-DS lineOutput LEN(132) INZ;
// END-DS;


// lineOutput = %trim(MESSAGE);
    
// write QSYSPRT lineOutput;

// End-Proc;

// ============================================================
//  Ferme le spool.
// ============================================================
// Dcl-Proc CloseSpool export;
// Dcl-PI *N;
// End-PI;

// if (%open(QSYSPRT));
//     close QSYSPRT;
// endif;

// End-Proc;
