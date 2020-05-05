load('tmp_result.mat')
inc = peak_u(:,3);
head = inc(1);
tail = inc(101);
inc = [head, inc', tail];

predict = [data.mppu];
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

% x1 = 1.55;
% y1 = 57.45;
% x2 = 1.71;
% y2 = 53;
% x3 = 1.8;
% y3 = 54.23;
% 
% for i = 1:101
%     if x(i) >= x1 && x(i) <= x3
%         predict_p(i) = (x(i)-x1)*(x(i)-x2)/(x3-x1)/(x3-x2)*y3+(x(i)-x1)*(x(i)-x3)/(x2-x1)/(x2-x3)*y2+(x(i)-x2)*(x(i)-x3)/(x1-x2)/(x1-x3)*y1;
%     end
% end
x = [0, x, 3];
plot(x, predict, 'k');
hold on
plot(x, inc, '--k');
plot(x, predict_u, '-.k');
axis([0 3 0 50]);
legend({'Voltage expected', 'Incremental conductance', 'ANN'});
xlabel('Time(s)')
ylabel('Voltage(V)')
