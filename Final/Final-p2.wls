#!/usr/bin/env wolframscript
(* ::Package:: *)

ns = {{-s,s},{s+1,1}};
ds = (s-1)(s+2)^2{{1,0},{0,1}} // Expand;
dsns = Join[ds,ns,1];
dsns // MatrixForm
op1 = {{1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,1,1}};
op2 = {{0,0,0,1},{1,0,0,-s^3-3s^2+4},{0,1,0,0},{0,0,1,s}};
op3 = {{1,0,0,0},{0,0,0,1},{0,0,1,-(s+1)},{0,1,0,-(-s^2-2s+1)}};
op4 = {{1,0,1/2,0},{0,0,1,0},{0,1,1/2(s),0},{0,0,1,1}};
res = op4.op3.op2.op1.dsns // FullSimplify // Expand;
res // MatrixForm
Det[op1]
Det[op2]
Det[op3]
Det[op4]
res // MatrixForm // TeXForm
rs = res[[1;;2,All]];
rs // MatrixForm


Inverse[rs] // MatrixForm
n1s = ns.Inverse[rs] // FullSimplify;
n1s // MatrixForm
d1s = ds.Inverse[rs] // FullSimplify;
d1s // MatrixForm

n1s.rs.Inverse[d1s.rs] // FullSimplify // MatrixForm
n1s.Inverse[d1s] // FullSimplify // MatrixForm


Det[d1s] // Factor
Det[n1s]


aco = {
{0,0,0,0,0},
{1,0,0,0,0},
{0,1,0,0,0},
{0,0,0,0,0},
{0,0,0,1,0}
};
aco // MatrixForm
bco = Transpose[{{1,0,0,0,0},{0,0,0,1,0}}];
bco //MatrixForm
ss = DiagonalMatrix[{s^3,s^2}];
ss // MatrixForm
psis = {{s^2,0},{s,0},{1,0},{0,s},{0,1}};
psis // MatrixForm
dhc = {{1, -1/2},{0,-1/2}};
dhc // MatrixForm
dlc = {{3, 0, -4, -1/2, 1}, {0,0,0,-1/2,1}};
dlc // MatrixForm
nlc = {{0,-1,0,0,0},{0,1,1,0,-1/2}};
nlc // MatrixForm


n1s == nlc.psis // FullSimplify
d1s == (dhc.ss + dlc.psis) // FullSimplify
ac = aco - bco.Inverse[dhc].dlc // FullSimplify;
ac // MatrixForm
bc = bco.Inverse[dhc] // FullSimplify;
bc // MatrixForm
cc = nlc;
cc // MatrixForm
cc // MatrixForm // TeXForm


pbhMat = Join[s IdentityMatrix[5] - ac, bc, 2];
pbhMat // MatrixForm 
Eigenvalues[ac]
MatrixRank[pbhMat /. s->-2]
MatrixRank[pbhMat /. s->1]


pbhMat = Join[s IdentityMatrix[5] - ac, cc, 1];
pbhMat // MatrixForm// TeXForm
MatrixRank[pbhMat /. s->-2]
MatrixRank[pbhMat /. s->1]


a1 = {{0,0,1,0,0},{0,0,0,1,0},{0,0,0,0,1},{1,2,-1/2,-1,-1/2},{4,0,0,0,-3}};
b1 ={{-1,1},{1,0},{3,-3},{-2,1},{-9,9}};
c1 = {{0,0,3/4,0,1/4},{1/4,1/2,-1/8,1/2,-1/8}};
a2 = ac;
b2 = bc;
c2 = cc;

{s1,j1} = JordanDecomposition[a1];
s1.j1.Inverse[s1] == a1
{s2,j2} = JordanDecomposition[a2];
s2.j2.Inverse[s2] == a2
transf = s2.Inverse[s1];
transf // MatrixForm
s1.b1 == s2.b2


a2 == transf.a1.Inverse[transf]
b2 == transf.b1 // MatrixForm
c2 == c1.Inverse[transf] // MatrixForm



