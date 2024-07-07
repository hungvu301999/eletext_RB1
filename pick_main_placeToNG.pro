ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Func func1()
    SetAcc(50,50);
    Movl Offset(P[37],PR[10]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];# Move down to material position
    SetAcc(OFF);
    Out[2]=1;
    If In[3]==0
        Delay T[0.5];
        Out[563]=1;
    EndIf;
    Wait In[3]==ON;
    Delay T[0.3];
    Movl P[37],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];# add new11/6
    Out[592]=1; # finished tacking picture + suction main
    Wait  In[752] == ON;
    Out[592]=0;
    Movj P[27],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
    Movj P[55],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];#NG point
    Movl Offset(P[55],PR[14]),V[InW[38]],Z[0],Tool[0],Wobj[0];#NG point
    Delay T[0.5];
    Out[2]=0;
    Movl P[55],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
    Out[595]=1; #Send To PLC when Robot placed main To NGpoint
    Incr R[2];
    Wait  In[752] == ON And In[756]==1;
    Out[595]=0;
    Movj P[27],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
EndFunc;
