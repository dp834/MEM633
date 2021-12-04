#!/usr/bin/env wolframscript
(* ::Package:: *)

gs = (s-2)/(s^2-4s);
tfmodel = TransferFunctionModel[gs,s]
ssmodel = StateSpaceModel[tfmodel]


a = {{0,1},{0,4}};
b = Transpose[{{0,1}}];
c = {{-2,1}};


r = {{1}};
q = IdentityMatrix[2];
h = Join[Join[Transpose[a], -Transpose[c].Inverse[r].c,2],Join[-q,-a,2],1];
h // MatrixForm;
{evals,evecs} = Eigensystem[h] // FullSimplify;
Map[MatrixForm,%]
tmat = Join[evecs[[1;;1, All]],evecs[[3;;3,All]],1]// Transpose;
tmat // MatrixForm
t1 = tmat[[1;;2,All]];
t2 = tmat[[3;;4,All]];
x = t2.Inverse[t1] // FullSimplify;
x // N // MatrixForm
hGains = Transpose[r.c.x]
a-hGains.c // Eigenvalues


a.x +x.Transpose@a-x.Transpose[c].Inverse[r].c.x + q // FullSimplify
x = RiccatiSolve[{Transpose[a],Transpose[c]},{q,r}]// N // MatrixForm


r = {{1}};
q = IdentityMatrix[2];
h = Join[Join[a, -b.Inverse[r].Transpose[b],2],Join[-q,-Transpose[a],2],1];
h // MatrixForm;
{evals,evecs} = Eigensystem[h]//FullSimplify;
Map[MatrixForm,N[%]]
tmat = Join[evecs[[1;;1, All]],evecs[[3;;3,All]],1]// Transpose;
tmat //N // MatrixForm
t1 = tmat[[1;;2,All]];
t2 = tmat[[3;;4,All]];
x = t2.Inverse[t1] // FullSimplify;
x // MatrixForm
fGains = r.Transpose[b].x
a-b.fGains // Eigenvalues // N
fGains // MatrixForm // TeXForm


Transpose[a].x +x.a-x.b.Inverse[r].Transpose[b].x + q // FullSimplify
x = RiccatiSolve[{a,b},{q,r}]// N // MatrixForm


ak = a-b.fGains-hGains.c;
ak // MatrixForm
bk = hGains;
bk // MatrixForm
ck = fGains;
ck //MatrixForm
k1s = ck.Inverse[s IdentityMatrix[2] - ak].bk // FullSimplify // First // First;
k1s // N // Expand //Simplify


cl1 = Join[Join[a,-b.fGains,2],Join[bk.c,ak,2],1];
cl1 // N // MatrixForm
Eigenvalues[cl1] // N


Join[c,{{0,0}},2].MatrixExp[cl1 t].{{1},{0},{0},{0}} // N // FullSimplify
Plot[%,{t,0,20}]



