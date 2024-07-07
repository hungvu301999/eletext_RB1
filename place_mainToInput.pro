ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Func func3()
    Wait  In[756]==1;
    Movj P[55],V[InW[38]],Z[0],Tool[0],Wobj[0];# NG point
    Movl Offset(P[55],PR[11]),V[InW[38]],Z[0],Tool[0],Wobj[0];#NG point
    Out[2]=1;
    Delay T[0.3];
    If In[3]==0
        Delay T[0.5];
        If In[3]==0
            Out[563]=1;
        EndIf;
    EndIf;
    Wait In[3]==ON;
    Movl P[55],V[InW[38]],Z[0],Tool[0],Wobj[0];
    Movj P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
    Movj P[37],V[InW[38]],Z[0],Tool[0],Wobj[0];
    SetAcc(50,50);
    Movl Offset(P[37],PR[10]),V[InW[38]],Z[0],Tool[0],Wobj[0];
    SetAcc(OFF);
    Delay T[0.5];
    Out[2]=0;
    Out[596]=1; ##Send To PLC when Robot returned main To input Tray
    Movl P[37],V[InW[38]],Z[0],Tool[0],Wobj[0];
    Out[596]=0;
    Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
    Wait  In[752] == ON And In[756]==1;
EndFunc;
