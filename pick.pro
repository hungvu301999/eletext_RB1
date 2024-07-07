ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Include "pick_main_placeToNG.pro";
Include "take_picture.pro";
Func func2()
    If In[2]==1 # tool2 has sub2
        R[105]=1;
        Goto L[101]; 
    EndIf;
    Goto L[100];
    L[100]:
    take_picture.func1();
    If R[103]==0 And In[753]==1# has main In NG   
        Wait  In[752] == ON And In[756]==1;
        Movj P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
        place_mainToInput.func3();
        Goto L[100];
    EndIf;
    L[101]:
    Movj Offset(P[26],PR[1]),V[InW[38]],Z[0],Tool[R[103]];
    P[33]= GetCurPos();
    L[102]:
    If R[103]==2
        If R[105]==2
            #If R[105]==2 #PLC chooses In Port when tool2 pick sub2 To output Pallet
            Out[0]=1;
            SetAcc(50,50);
            Movl Offset(P[33],PR[2]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
            SetAcc(OFF);
            Out[5]=1;
            Delay T[0.3];
            L[103]:
            Incr R[104];# number of attract
            If In[2]==0
                Delay T[0.5];
                If In[2]==0 And R[104]<3
                    If R[104]<2
                        Out[0]=0;
                        Delay T[0.5];
                        Out[0]=1;
                        Goto L[103];
                    Else
                        Out[561]=1;
                        R[104]=0;
                    EndIf;
                EndIf;
            EndIf;
            Wait In[2]==ON;
            Delay T[0.3];
            Movl P[33],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];# add new11/6
            Out[0]=0;
            Out[592] = 1; # finished tacking picture + suction sub
            Wait  In[752] == ON And In[756]==1; #And In[2]==0;
            Out[592] = 0;
            #pick sub2
        ElseIf R[105]==1 #PLC chooses In Port when tool2 pick sub2 To NG
            Movj P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
            Movj P[54],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
            Movl Offset(P[54],PR[11]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
            Out[0]=1;
            Delay T[0.5];
            Out[5]=1;
            If In[2]==0
                Delay T[0.5];
                If In[2]==0
                    Out[561]=1;
                EndIf;
            EndIf;
            Wait In[2]==ON;
            Delay T[0.3];
            Out[0]=0;
            Movl P[54],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
            P[37]= GetCurPos();
            Out[597]=1; #Send To PLC when Robot placed Sub2 To NG
            Wait  In[752] == ON And In[756]==1;
            Out[597]=0; 
            Movj P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
            Goto L[100];
        Else
            Wait In[752] == ON And In[756]==1;
        EndIf;
    ElseIf R[103]==3
        Out[1]=1;
        SetAcc(50,50);
        Movl Offset(P[33],PR[2]),V[InW[38]],Z[0],Tool[R[103]],Wobj[0];
        SetAcc(OFF);
        Out[3]=1;
        If In[4]==0
            Delay T[0.5];
            If In[4]==0
                Out[562]=1;
            EndIf;
        EndIf;
        Wait In[4]==ON;
        Delay T[0.3];
        Movl P[33],V[InW[38]],Z[0],Tool[R[103]],Wobj[0];# add new11/6
        Out[1]=0;
        Out[592]=1; # finished tacking picture + suction sub
        Wait  In[752] == ON And In[756]==1;
        Out[592] =0;
    ElseIf R[103]==0
        P[37]= GetCurPos();
        pick_main_placeToNG.func1();
        Goto L[100];
    EndIf;
EndFunc;
