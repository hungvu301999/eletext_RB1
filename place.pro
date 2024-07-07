ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Include "pick.pro";
Func func1()
    L[10]:
    Movj P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
    Wait In[757]==1;
    Movl P[28],V[InW[38]],Z[0],Tool[0],Wobj[0];
    If R[103]==2
        If InW[35]==1 And InW[36] ==1 Or InW[36] ==2
            Continue;
        ElseIf InW[35]==2 And InW[36] ==3 Or InW[36] ==4
            Continue;
        ElseIf InW[35]==3 And InW[36] ==5 Or InW[36] ==6
            Continue;
        Else
            Out[566] =1;# error when plc sent wrong Pallet signal
            Wait In[752] ==ON;
        EndIf;
        P[20] = Pallet(InW[36],InW[44],InW[45],0);# type of pallet
        Print InW[36];
        Print InW[44];
        Print InW[45];
        Print P[20];
        Movj Offset(P[20],PR[12]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
        Print PR[12];
        P[34]= GetCurPos();
        Print P[34];
        ####
        Out[0]=1;
        SetAcc(50,50);
        Movl Offset(P[34],PR[3]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
        SetAcc(OFF);
        Delay T[0.1];
        Out[5]=0;
        Delay T[0.1];
        Out[0]=0;
        Out[593]=1; #Send To PLC when Robot placed Sub To output pallet
        Delay T[0.1];
        Wait  In[752] == ON;
        Out[593]=0; 
    ElseIf R[103]==3
        P[20] = Pallet(InW[36],InW[44],InW[45],0);
        Print P[20];
        Print PR[12];
        # Movj P[20],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
        Movj Offset(P[20],PR[13]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
        Print PR[12];
        P[34]= GetCurPos();
        Print P[34];
        ###
        Out[1]=1;
        SetAcc(50,50);
        Movl Offset(P[34],PR[3]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
        SetAcc(OFF);
        Delay T[0.1];
        Out[3]=0;
        Delay T[0.1];
        Out[1]=0;
        Out[593]=1; #Send To PLC when Robot placed Sub To output pallet
        Wait  In[752] == ON;
        Out[593]=0;
    EndIf;
    Movl P[20],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
    R[210]=0;
EndFunc;
