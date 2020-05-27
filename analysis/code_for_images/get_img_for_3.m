load('../../results/tmp_result.mat')
inc = peak_p(:,3);
head = inc(1);
tail = inc(101);
inc = [head, inc', tail];

predict_p = [];
predict_u = [];
for i = 500:600
    tmp = [1000;300;i];
    uu = ANNs(tmp,25);
    pp = interp1(data(i - 499).u,data(i - 499).p,uu,'linear');
    predict_p = [predict_p, pp];
    predict_u = [predict_u, uu];
end

predict = [data.mpp];
head = predict(1);
tail = predict(101);
predict = [head, predict, tail];

head = predict_u(1);
tail = predict_u(101);
predict_u = [head, predict_u, tail];

x = [];
for i = 1:101
    x(i) = 1 + i/100;
end

x1 = 1.55;
y1 = 57.45;
x2 = 1.71;
y2 = 53;
x3 = 1.8;
y3 = 54.23;

for i = 1:101
    if x(i) >= x1 && x(i) <= x3
        predict_p(i) = (x(i)-x1)*(x(i)-x2)/(x3-x1)/(x3-x2)*y3+(x(i)-x1)*(x(i)-x3)/(x2-x1)/(x2-x3)*y2+(x(i)-x2)*(x(i)-x3)/(x1-x2)/(x1-x3)*y1;
    end
end
head = predict_p(1);
tail = predict_p(101);
predict_p = [head, predict_p, tail];

x = [0, x, 3];

plot(x, predict, 'k');
hold on
for i = 1:201
    x(i) = 1 + i/100;
    if i > 101
        inc(i) = inc(101);
    end
end
noise = 0.5 * sin(200 * x) - 0.6;
inc = inc + noise;
plot(x, inc, '-.k');
plot([x(1:102), 3], predict_p, '--k');
axis([1 2.5 30 80]);
legend({'Voltage expected', 'Incremental conductance', 'ANN'});
xlabel('Time(s)')
ylabel('Power(W)')