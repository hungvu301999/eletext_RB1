ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Func func5()
    Movj P[28],V[InW[38]],Z[0],Tool[0],Wobj[0];
    Wait In[756]==1;
    Movj P[54],V[InW[38]],Z[0],Tool[2],Wobj[0];# NG point
    Movl Offset(P[54],PR[13]),V[InW[38]],Z[0],Tool[2],Wobj[0];
    Out[0]=1;
    Out[5]=1;
    Delay T[0.5];
    If In[2]==0
        Delay T[0.5];
        Out[561]=1;
    EndIf;
    Wait In[2]==ON;
    Delay T[0.5];
    Movl P[54],V[InW[38]],Z[0],Tool[2],Wobj[0];
    Movj P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
    Movj P[37],V[InW[38]],Z[0],Tool[2],Wobj[0];
    SetAcc(50,50);
    Movl Offset(P[37],PR[10]),V[InW[38]],Z[0],Tool[2],Wobj[0];
    SetAcc(OFF);
    Out[0]=0;
    Delay T[0.3];
    Out[5]=0;
    Movl P[37],V[InW[38]],Z[0],Tool[2],Wobj[0];
    Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
    Out[598]=1; ##Send To PLC when Robot returned main To input Tray
    Wait  In[752] == ON And In[756]==1;
    Out[598]=0;
EndFunc;
