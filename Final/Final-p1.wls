#!/usr/bin/env wolframscript
(* ::Package:: *)

ns = {{-s,s},{s+1,1}};
drs = (s-1)(s+2)^2{{1,0},{0,1}};

nsExp = {{-1,1},{1,0}}s + {{0,0},{1,1}}
ds = (s-1)(s+2)^2 // Expand

sys = ns/ds
tfmodel = TransferFunctionModel[sys,s]
ssmodel = StateSpaceModel[%]


a = {
{-3,  0, 0, 0, 4, 0 },
{ 0, -3, 0, 0, 0, 4 },
{ 1,  0, 0, 0, 0, 0 },
{ 0,  1, 0, 0, 0, 0 },
{ 0,  0, 1, 0, 0, 0 },
{ 0,  0, 0, 1, 0, 0 }
};
b = {
{1, 0},
{0, 1},
{0, 0},
{0, 0},
{0, 0},
{0, 0}
};
c = {{0,0,-1,1,0,0},{0,0,1,0,1,1}};
d = {{0,0},{0,0}};
a // MatrixForm
b // MatrixForm
c // MatrixForm


pbhMat = Join[s IdentityMatrix[6] - a, b,2];
pbhMat // MatrixForm
Eigenvalues[a]
MatrixRank[pbhMat /. s->-2]
MatrixRank[pbhMat /. s->1]


pbhMat = Join[s IdentityMatrix[6] - a, c, 1];
pbhMat // MatrixForm
MatrixRank[pbhMat /. s->-2]
MatrixRank[pbhMat /. s->1]


obsmat = Join[c.a,c.a.a,c.a.a.a,1][[1;;5, All]];
obsmat // MatrixForm
MatrixRank[obsmat]
tInv = Join[obsmat,{{1,0,0,0,0,0}},1];
tInv // MatrixForm
MatrixRank[tInv]
t = Inverse[tInv];
t // MatrixForm


abar = tInv.a.t;
abar // MatrixForm
bbar = tInv.b;
bbar // MatrixForm 
cbar = c.t;
cbar // MatrixForm


amin = abar[[1;;5,1;;5]];
amin // MatrixForm
bmin = bbar[[1;;5,All]];
bmin // MatrixForm
cmin = cbar[[All,1;;5]];
cmin // MatrixForm


cmin.Inverse[(s IdentityMatrix[5] - amin)].bmin // FullSimplify // MatrixForm


Eigenvalues[amin]
poleMat = Join[Join[s IdentityMatrix[5] - amin, bmin, 2], Join[-cmin, {{0,0},{0,0}},2],1];
poleMat // MatrixForm
Det[poleMat]



