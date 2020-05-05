load ../results/result.mat
k = 0;
for i = 1:1:17000
    if data(i).T == 25 && data(i).Ir == 1000 && data(i).diffIr1 == 300 && data(i).diffIr2 == 500
        k = k + 1;
        result(k) = data(i);
    end
    if data(i).T == 25 && data(i).Ir == 1000 && data(i).diffIr1 == 300 && data(i).diffIr2 == 600
        k = k + 1;
        result(k) = data(i);
    end
end
hold on
plot(result(1).mppu, result(1).mpp, 'ko', 'MarkerSize', 10)
plot(result(2).mppu, result(2).mpp, 'k*', 'MarkerSize', 10)
plot([result(1).u], [result(1).p], 'k')
plot([result(2).u], [result(2).p], 'k')
axis([0 45 0 80]);
legend({'MPP of PSC1', 'MPP of PSC2'}, 'Location', 'northwest');
xlabel('Voltage(V)');
ylabel('Power(W)');