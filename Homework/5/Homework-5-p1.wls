#!/usr/bin/env wolframscript
(* ::Package:: *)

hs = {{1/(s-1)^2, 1/((s-1)(s+3))},{-6/((s-1)(s+3)^2),(s-2)/(s+3)^2}}
hs // MatrixForm
ds = (s-1)^2(s+3)^2
ns = ds hs // Simplify


rowop1 = {{1,(s+7)/6},{0,1}};
colop1 = {{1, (s^2-3s)/6},{0,1}};
op1res = rowop1.ns.colop1 // Simplify // Expand;
op1res // MatrixForm
rowop2 = {{1, 0},{0,1}};
colop2 = {{1,0},{0,1}};
op2res = rowop2.op1res.colop2 // Simplify // Expand;
op2res // MatrixForm
rowop3 = {{1, 0},{6(s-1)/16,1}};
colop3 = {{1, -(s^4/6+s^3/2-s^2/6-s/2-16/3)/16}, {0,1}};
op3res = rowop3.op2res.colop3 // Simplify // Expand;
op3res // MatrixForm
u = rowop3.rowop2.rowop1;
u //MatrixForm
v = colop1.colop2.colop3;
v // MatrixForm
ms = u.ns.v / ds // Simplify
Det[u]
Det[v]


ms // MatrixForm
u1 = Inverse@u
u2 = Inverse@v
u1//MatrixForm
u2//MatrixForm
u1.ms.u2 // Simplify // MatrixForm


eps = DiagonalMatrix[{16,s(s+1)}];
psi = DiagonalMatrix[{(s-1)^2(s+3)^2, 16(s+3)}];
n0 = u1.eps // Simplify // Expand;
n0 // MatrixForm
d0 = Inverse[u2].psi // Simplify // Expand;
d0 // MatrixForm


dhc = {{1/6,-1/96},{0,0}};
dhc // MatrixForm
dic = {{0,1/6,5/6,1/2,-3/2,0,-1/96,-7/96,1/96,7/96, 0},{0,0,-1,2,-1,0,0,1/16,0,-1/16,0}};
dic // MatrixForm
aco = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 1, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 1, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 1, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 1, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 1, 0, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 1, 0, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 1, 0, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 1, 0 },
{ 0, 0, 0, 0, 0, 0, 0, 0, 1 }
};
aco //MatrixForm
bco = {
{ 1, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 1 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 },
{ 0, 0 }
};
bco // MatrixForm
ac = aco - bci.Inverse[dhc].dic // Simplify



