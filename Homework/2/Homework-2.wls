norm1 = Solve[Norm[{x, y}, 1] == 1, y, Reals]
p = Plot[y /. norm1, {x, -2, 2}, PlotRange -> {-1, 1}, AspectRatio -> 1]
Export["images/l1_norm.png",
    p
]

norm2 = Solve[Norm[{x, y}, 2] == 1, y, Reals]
p = Plot[y /. norm2, {x, -2, 2}, PlotRange -> {-1, 1}, AspectRatio -> 1]
Export["images/l2_norm.png",
    p
]

normInfty = Solve[Norm[{x, y}, Infinity] == 1, y, Reals]
p = Plot[y /. normInfty, {x, -2, 2}, PlotRange -> {-1, 1}, AspectRatio -> 1]
Export["images/linfinity_norm.png",
    p
]
