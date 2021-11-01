#!/usr/bin/env wolframscript
(* ::Package:: *)

gs = (s-1)/(s^2-2s);
ks = (s^2-2s)/((s+3)(s+1));
closedLoop = gs ks / (1 + gs ks) // Simplify
Reduce[Denominator[%]==0, s]


step = 1/s;
Expand[closedLoop * step]
stepResponse = InverseLaplaceTransform[closedLoop * step,s,t] // Simplify
pStepResponse = Plot[stepResponse, {t,0,15}, PlotRange->All, PlotLegends->{"Step Response"}]
Export["images/p3_step_response.png", Show[pStepResponse]]



