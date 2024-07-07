ProgramInfo
    Version = "S4.24"
    VRC = "V4R24"
    Time = "7/8/2024 2:03:59 AM"
    RobotName = "IR-S7-60Z30S3-A2LH_01740511"
EndProgramInfo
Func func1()
    String new = "C1";
    B[1]=GetSocketNo("192.168.3.129",R[1]);
    Out[4] =1;
    P[1].X = P[9].X - InW[50];
    P[1].Y = P[9].Y - InW[52];
    P[1].A = P[9].A;
    P[6].X = P[9].X;
    P[6].Y = P[9].Y - InW[52];
    P[6].A = P[9].A;
    P[7].X = P[9].X + InW[50];
    P[7].Y = P[9].Y - InW[52];
    P[7].A = P[9].A;
    P[8].X = P[9].X + InW[50];
    P[8].Y = P[9].Y;
    P[8].A = P[9].A;
    P[10].X = P[9].X - InW[50];
    P[10].Y = P[9].Y;
    P[10].A = P[9].A;
    P[11].X = P[9].X - InW[50];
    P[11].Y = P[9].Y + InW[52];
    P[11].A = P[9].A;
    P[12].X = P[9].X ;
    P[12].Y = P[9].Y + InW[52];
    P[12].A = P[9].A;
    P[13].X = P[9].X + InW[50];
    P[13].Y = P[9].Y + InW[52];
    P[13].A = P[9].A;
    P[14].X = P[9].X;
    P[14].Y = P[9].Y;
    P[14].A = P[9].A -InW[54];
    P[15].X = P[9].X;
    P[15].Y = P[9].Y;
    P[15].A = P[9].A;
    P[16].X = P[9].X;
    P[16].Y = P[9].Y;
    P[16].A = P[9].A + InW[54];
    ####
    Movj P[1],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[6],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[7],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[8],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[9],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[10],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[11],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[12],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[13],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[14],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[15],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Movj P[16],V[25],Z[0],Tool[1],Wobj[0];
    Send Port[R[1]],new;
    Delay T[1];
    Out[610]=1;
    Out[4] =1;
EndFunc;
