tic
clear
%设置仿真参数，包含温度、光照的范围及步长
minT = -40;
maxT = 80;
stepT = 5;
minIr = 0;
maxIr = 1400;
stepIr = 100;
model = 'PV_array_model';
%计算数据组数，并以此预分配data的内存空间
cnt = 0;
for T = minT:stepT:maxT
    for Ir = minIr:stepIr:maxIr
        for diffIr2 = minIr:stepIr:Ir
            for diffIr1 = minIr:stepIr:diffIr2
                cnt = cnt + 1;
            end
        end
    end
end
tot = cnt;
cnt = 0;
%预分配data内存空间
data(tot).T = 0;
data(tot).Ir = 0;
data(tot).diffIr1 = 0;
data(tot).diffIr2 = 0;
data(tot).p = [];
data(tot).u = [];
data(tot).i = [];
data(tot).mpp = 0;
data(tot).mppu = 0;
%开始仿真
set_param(model, 'FastRestart', 'off');
rate=waitbar(0, '已运算0组数据,完成0%');
for T = minT:stepT:maxT
    set_param(model, 'FastRestart', 'on');
    for Ir = minIr:stepIr:maxIr
        for diffIr2 = minIr:stepIr:Ir
            for diffIr1 = minIr:stepIr:diffIr2
                cnt = cnt + 1;
                sim(model);
                %求最大功率点及其对应电压
                p = load('P.mat');
                u = load('U.mat');
                i = load('I.mat');
                [data(cnt).mpp,index]=max(p.ans.Data);
                data(cnt).mppu=u.ans.Data(index);
                %记录各项数据
                data(cnt).T = T;
                data(cnt).Ir = Ir;
                data(cnt).diffIr1 = diffIr1;
                data(cnt).diffIr2 = diffIr2;
                data(cnt).p = p.ans.Data;
                data(cnt).u = u.ans.Data;
                data(cnt).i = i.ans.Data;
            end
        end
    end
    set_param(model, 'FastRestart', 'off');
    waitbar(cnt/tot, rate, sprintf('已运算%d组数据, 完成%.1f%%', cnt, cnt/tot*100));
end
close(rate);
%保存仿真结果
save result data
fprintf('运算完毕!共 %d 组数据\n', cnt);
toc