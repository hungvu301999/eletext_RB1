ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:03:59 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Include "place.pro";
Include "pick.pro";
Include "place_mainToInput.pro";
Include "place_sub2ToInput.pro";
Include "calibCam.pro";
Start;
    R[2]=0;
    R[210]=0;
    R[103]=1;
    R[104]=0;
    GripLoad 1;
    PR[2] = (0,0,-138.5,0,0,0);
    PR[10] = (0,0,-156,0,0,0);# pick main In input tray
    PR[11] = (0,0,-107,0,0,0);# place sub In NG
    PR[12] = (0,R[104],0,0,0,0);
    PR[13] = (0,0,-87,0,0,0); # pick sub In NG
    PR[14] = (0,0,-108,0,0,0); # place main In NG
    Pallet 1,P[17],P[18],P[19],3,2,1,17;
    Pallet 2,P[21],P[22],P[23],3,2,1,17;
    Pallet 3,P[38],P[39],P[40],2,4,1,17;
    Pallet 4,P[42],P[43],P[44],1,4,1,17;
    Pallet 5,P[46],P[47],P[48],4,3,1,17;
    Pallet 6,P[50],P[51],P[52],3,3,1,17;
    PR[3] = (0,0,-92,0,0,0);
    L[0]:
    Out[610]=0;
    If In[520]==1
        P[35]= GetCurPos(Tool[R[103]]);
        If P[35].X>300 And P[35].X<355 And P[35].Y<-350
            Movj P[27],V[30],Z[0],Tool[0],Wobj[0];
        EndIf;
        If P[35].Y<-350
            Out[0]=0;
            Out[1]=0;
            If In[3]==0
                Out[2]=0;
            EndIf;
            If In[4] ==0
                Out[3]=0;
            EndIf;
            Out[4]=0;
            If In[2]==0
                Out[5]=0;
            EndIf;
            Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
            Wait  In[752] == ON And In[756]==1;
            Delay T[0.2];
        ElseIf P[35].Y>=-350 And P[35].Y<=-124.686
            Movj P[27],V[30],Z[0],Tool[0],Wobj[0];
            Out[0]=0;
            Out[1]=0;
            If In[3]==0
                Out[2]=0;
            EndIf;
            If In[4] ==0
                Out[3]=0;
            EndIf;
            Out[4]=0;
            If In[2]==0
                Out[5]=0;
            EndIf;
            Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
            Wait  In[752] == ON And In[756]==1;
            Delay T[0.2];
        ElseIf P[35].Y>-124.686
            Movj P[28],V[30],Z[0],Tool[0],Wobj[0];
            Out[0]=0;
            Out[1]=0;
            If In[3]==0
                Out[2]=0;
            EndIf;
            If In[4] ==0
                Out[3]=0;
            EndIf;
            Out[4]=0;
            If In[2]==0
                Out[5]=0;
            EndIf;
            Movl P[27],V[30],Z[0],Tool[0],Wobj[0];
            Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
            Wait  In[752] == ON And In[756]==1;
            Delay T[0.2];
        EndIf;
    EndIf;
    Out[0]=0;
    Out[1]=0;
    If In[3]==0
        Out[2]=0;
    EndIf;
    If In[4] ==0
        Out[3]=0;
    EndIf;
    Out[4]=0;
    If In[2]==0
        Out[5]=0;
    EndIf;
    If In[758]==1
        calibCam.func1();
        Wait In[752]==1;
        Goto L[0];
    EndIf;
    If In[2]==1 And Out[5] ==1
        If In[759]==1
            place.func1();
        Else
            pick.func2();
        EndIf;
    ElseIf In[4]==1 And Out[3] ==1
        place.func1();
    ElseIf In[3]==1 And Out[2] ==1
        pick_main_placeToNG.func1();
    EndIf;
    L[1]:
    # Pick sub In input Tray
    pick.func2();
    PR[12] = (0,R[104],0,0,0,0);
    If In[755]==1
        Goto L[2];
    EndIf;
    pick.func2();
    PR[13] = (0,R[104],0,0,0,0);
    # Place sub To output pallet
    L[2]:
    R[103]=2;
    place.func1();
    If In[755]==1
        Goto L[12];
    EndIf;
    R[103]=3;
    place.func1();
    Goto L[12];
    L[12]:
    # Place Main To Input Tray
    If In[753]==1 # has main In NG
        Movj P[28],V[InW[38]],Z[0],Tool[0],Wobj[0];
        place_mainToInput.func3();
    ElseIf In[754]==1 # has sub2 In NG
        Movj P[28],V[InW[38]],Z[0],Tool[0],Wobj[0];
        place_sub2ToInput.func5();
    Else
        Movj P[28],V[InW[38]],Z[0],Tool[0],Wobj[0];
        Wait  In[756]==1;
        Movl P[27],V[InW[38]],Z[0],Tool[0],Wobj[0];
        Movj P[25],V[InW[38]],Z[0],Tool[1],Wobj[0];
        Print R[2];
        Out[577]=1;
        Out[577]=0;
        Wait  In[752] == ON And In[756]==1;
    EndIf;
    Goto L[1]; # return To pick func
End;
