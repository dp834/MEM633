#!/usr/bin/env wolframscript
(* ::Package:: *)

gs = (s-2)/(s(s^2+1))
Expand[gs]
impulseResponse = InverseLaplaceTransform[gs,s,t]


Expand[gs /s]
stepResponse = InverseLaplaceTransform[gs / s,s,t]


Expand[gs /(s^2+1)]
sinResponse = InverseLaplaceTransform[gs / (s^2+1),s,t]
Collect[%,t]


pStepResponse = Plot[stepResponse, {t, 0, 25}, PlotLegends->{"Step Response"}];
pSinResponse = Plot[sinResponse, {t,0,25}, PlotLegends->{"Sin Response"}];
pGrid = Grid[{{pStepResponse,pSinResponse}}, ItemStyle->ImageSizeMultipliers->{1, 1}]
Export["images/p2_2_unbouded_responses.png", pGrid]


StateSpaceModel[TransferFunctionModel[gs,s], StateSpaceRealization->"ControllableCompanion"]


a = {{0,1,0},{0,0,1},{0,-1,0}};
{d,p} = Eigensystem[a];
Transpose[p]
d
Transpose[p] . DiagonalMatrix[d] . Transpose[Inverse[p]] // MatrixForm
eat = MatrixExp[a t]
x0 = {{2},{0},{-2}};
eqns = eat . x0 // Simplify
responses = Plot[eqns, {t,0,2 Pi}, PlotLegends->{"x1","x2","x3"}];
Export["images/p2_zero_impulse_response.png", responses];



