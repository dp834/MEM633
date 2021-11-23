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
rowop2 = {{1, 0},{6(s-1)/16,1}};
colop2 = {{1, -(s^4/6+s^3/2-s^2/6-s/2-16/3)/16}, {0,1}};
op2res = rowop2.op1res.colop2 // Simplify // Expand;
op2res // MatrixForm
u = rowop2.rowop1 // Simplify;
u //MatrixForm
v = colop1.colop2 // Simplify;
v // MatrixForm
Det[u]
Det[v]


u.ns.v // Simplify // Factor // MatrixForm
ms = u.ns.v / ds // Simplify;
ms // MatrixForm
u1 = Inverse@u;
u2 = Inverse@v;
u1//MatrixForm
u2//MatrixForm
u1.ms.u2 // Simplify // MatrixForm
Det[u1]
Det[u2]


eps = DiagonalMatrix[{16,s(s+1)}];
psi = DiagonalMatrix[{(s-1)^2(s+3)^2, 16(s+3)}];
n0 = u1.eps // Simplify // Expand;
n0 // MatrixForm
d0 = v.psi // Simplify // Expand;
d0 // MatrixForm
n0.Inverse[d0] // Simplify // MatrixForm

colopExtra = {{1,s/6+1/3},{0,1}}.{{1,0},{-3s/7- 99/49,1}};
colopExtra // Simplify // MatrixForm
Det[colopExtra]
d1 = d0.colopExtra // Simplify;
d1 // MatrixForm
n1 = n0.colopExtra // Simplify;
n1 // MatrixForm
n1.Inverse[d1] // Simplify // MatrixForm
n1 // Expand // MatrixForm // TeXForm



dhc = {{480/49,7/3},{-48/7,0}};
dhc // MatrixForm
dic = {{960/49, -1440/49, -5, 3, -59/3, 19},{-2592/49, -4752/49, 0, 16, 48}};
dic // MatrixForm
aco = {
{ 0, 0, 0, 0, 0},
{ 1, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0},
{ 0, 0, 1, 0, 0},
{ 0, 0, 0, 1, 0}
};
aco //MatrixForm
bco = {
{ 1, 0 },
{ 0, 0 },
{ 0, 1 },
{ 0, 0 },
{ 0, 0 }
};
bco // MatrixForm
ac = aco - bco.Inverse[dhc].dic // Simplify






