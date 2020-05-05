Ir3 = [data.Ir] - [data.diffIr1];
mppu = [data.mppu];
plot(Ir3, mppu, 'k')
title('25¡æ, Ir1 = 1000W/m^2, Ir2 =  700W/m^2');
xlabel('Ir3 (W/m^2)');
ylabel('mppu (V)');

Ir2 = [data.Ir] - [data.diffIr1];
mppu = [data.mppu];
plot(Ir2, mppu, 'k')
title('25¡æ, Ir1 = 1000W/m^2, Ir3 =  500W/m^2');
xlabel('Ir2 (W/m^2)');
ylabel('mppu (V)');

for i = 2:17000
    if data(i,1) == data(i - 1, 1) && data(i, 3) == data(i - 1, 3) && data(i, 4) == data(i - 1, 4)
        if abs(data(i,6) - data(i - 1, 6)) > 6
            fprintf('%d\n', i);
        end
    end
end

Ir1 = [data.Ir];
mppu = [data.mppu];
plot(Ir1, mppu, 'k')
title('25¡æ, Ir2 = 800W/m^2, Ir3 =  500W/m^2');
xlabel('Ir1 (W/m^2)');
ylabel('mppu (V)');