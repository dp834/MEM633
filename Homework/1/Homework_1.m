A = [ -5 0; 2 -1];
B = [2; 0];
C = [0 50];
D = 0;

sys = ss(A,B,C,D);
[y, t, x] = impulse(sys);
plot(t,y);
hold on;
fplot(@(t) 50 * exp(-5*t) *(exp(4*t)-1), [t(1),t(end)], "black*");
legend("lsim", "Equation");
hold off;
saveas(gcf, "images/p2_impulse.png");

[y, t, x] = step(sys);
plot(t,y);
hold on;
fplot(@(t) 10 * (exp(-5 *t) -5 *exp(-t)+4), [t(1),t(end)], "black*");
legend("lsim", "Equation");
hold off;
saveas(gcf, "images/p2_step.png");
