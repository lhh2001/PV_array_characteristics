load ../../results/result.mat
k = 0;
for i = 1:1:17000
    Ir1 = data(i).Ir;
    Ir2 = data(i).Ir - data(i).diffIr1;
    Ir3 = data(i).Ir - data(i).diffIr2;
    if data(i).T == 25 && Ir1 == 600 && Ir2 == 600 && Ir3 == 600
        k = k + 1;
        result(k) = data(i);
    end
    if data(i).T == 25 && Ir1 == 800 && Ir2 == 800 && Ir3 == 800
        k = k + 1;
        result(k) = data(i);
    end
    if data(i).T == 25 && Ir1 == 1000 && Ir2 == 1000 && Ir3 == 1000
        k = k + 1;
        result(k) = data(i);
    end
end

plot([result(1).u], [result(1).p])
hold on
plot([result(2).u], [result(2).p])
plot([result(3).u], [result(3).p])
axis([0 45 0 140]);
legend({'600W/m^2', '800W/m^2', '1000W/m^2'}, 'location', 'northwest')
xlabel('Voltage (V)');
ylabel('Power (P)');
title('不同光照25℃下光伏阵列的 P-U 曲线');