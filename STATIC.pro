ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:04:00 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Start;
    P[56] = GetCurPos();
    If P[56].Y>-26.018
        Out[608]=1;
    Else
        Out[608]=0;
    EndIf;
    If P[56].Y<-26.018
        Out[609]=1;
    Else
        Out[609]=0;
    EndIf;
    If -79<P[56].X And P[56].X<-78 And -432< P[56].Y And P[56].Y<-431 And -1.1<P[56].Z And P[56].Z<-0.9 And 1.7<P[56].A And P[56].A<1.9
        Out[594]=1;
    Else
        Out[594]=0;
    EndIf;
    If In[2]==0 And Out[5]==1 And Out[0]==0
        Out[561]=1
    ElseIf In[2]==1 Or In[517]==1
        Out[561]=0;
    EndIf;
    ###
    If In[4]==0 And Out[3]==1 And Out[1]==0
    ElseIf In[4]==1 Or In[517]==1
        Out[562]=0;##
    EndIf;
    ####
    If In[3]==0 And Out[2]==1 And P[56].Z>-50
        Out[563]=1;
    ElseIf In[3]==1 Or In[517]==1
        Out[563]=0;##
    EndIf;
    ######
    If In[1]==0 And Out[0]==1
        Out[564]=1;
    Else
        Out[564]=0;
    EndIf;
    If In[1]==1 And Out[0]==0
        Out[564]=1;
    ElseIf In[0]==0 And Out[0]==0
    Else
        Out[564]=0;
    EndIf;
    If In[6]==1 And Out[1]==1
        Out[564]=1;
    Else
        Out[565]=0;
    EndIf;
    If In[5]==1 And Out[1]==0
        Out[565]=1;
    ElseIf In[6]==0 And Out[1]==0
    Else
        Out[565]=0;
    EndIf;
End;
