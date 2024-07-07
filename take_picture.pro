ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Include "place_mainToInput.pro";
Func func1()
    L[1]:
    String new = "C1"; 
    String read;
    B[1]=GetSocketNo("192.168.3.129",R[1]);
    #Print R[1];
    Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
    Out[4]=1;
    Delay T[0.1];
    Send Port[R[1]],new;
    Delay T[0.3];
    L[0]:
    Get Port[R[1]],T[0.1],Goto L[0];
    read = GetPortbuf(0,40,R[1]);
    Print read;
    StrGetData(read,",",R[100]);
    PR[1] = (R[100],R[101],0,R[102],0,0);
    Print R[104];
    Print R[105];
    Out[4]=0;
    If R[100]==0 And R[101]==0 And R[102]==0 #when vison sent wrong signal
        Out[567]=1;
        Wait  In[752] == ON And In[756]==1 And In[517]==1;
        Out[567]=0;
        Goto L[1];
    EndIf;
EndFunc;
