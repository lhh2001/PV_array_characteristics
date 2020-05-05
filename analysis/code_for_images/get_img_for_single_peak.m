load ../results/result.mat
k = 0;
for i = 1:1:17000
    Ir1 = data(i).Ir;
    Ir2 = data(i).Ir - data(i).diffIr1;
    Ir3 = data(i).Ir - data(i).diffIr2;
    if data(i).T == 25 && Ir1 == 1000 && Ir2 == 1000 && Ir3 == 1000
        k = k + 1;
        result(k) = data(i);
    end
end

plot([result(1).u], [result(1).i], 'k')
axis([0 45 0 4]);
xlabel('Voltage (V)');
ylabel('Current (A)');
% title('25℃, 1000W/m^2 下不同遮挡率下光伏阵列的 P-U 曲线');