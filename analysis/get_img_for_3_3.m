load result.mat
k = 0;
for i = 1:1:17000
    Ir1 = data(i).Ir;
    Ir2 = data(i).Ir - data(i).diffIr1;
    Ir3 = data(i).Ir - data(i).diffIr2;
    if data(i).T == 25 && Ir2 == 800 && Ir3 == 400
        k = k + 1;
        result(k) = data(i);
    end
end

% plot([result(1).u], [result(1).p], 'k')
hold on
for i = 1:2:k
    plot([result(i).u], [result(i).p])
end
axis([0 45 0 80]);
legend('800', '1000', '1200', '1400')
% legend({'0%','10%','20%','30%','40%'}, 'Location', 'northwest');
xlabel('Voltage (V)');
ylabel('Power (W)');
% title('25℃, 1000W/m^2 下不同遮挡率下光伏阵列的 P-U 曲线');