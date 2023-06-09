%% Adapting data to cmclogit in stata P1
cd("C:\Users\franc\OneDrive\Escritorio\registros UC\Econometric_T1");
clear;
clc;
%% Reading the data
Info = readtable("data_pregunta1.csv");
%% Filter

data_adapted = [];
for i=(1:size(Info,1))
    data = Info(i,:);
    r1 =[data.mrun data.distancia1 data.p_prioritario1 data.simce_lect1...
        data.simce_mate1 data.cod_nivel data.prioridad_hermano ...
        data.es_mujer data.prioritario data.alto_rendimiento ...
        "no_muni & no_conv"];
    r2 =[data.mrun data.distancia2 data.p_prioritario2 data.simce_lect2...
        data.simce_mate2 data.cod_nivel data.prioridad_hermano ...
        data.es_mujer data.prioritario data.alto_rendimiento ...
        "mun & no_conv"];
    r3 =[data.mrun data.distancia3 data.p_prioritario3 data.simce_lect3...
        data.simce_mate3 data.cod_nivel data.prioridad_hermano ...
        data.es_mujer data.prioritario data.alto_rendimiento ...
        "no_mun & conv"];
    r4 =[data.mrun data.distancia4 data.p_prioritario4 data.simce_lect4...
        data.simce_mate4 data.cod_nivel data.prioridad_hermano ...
        data.es_mujer data.prioritario data.alto_rendimiento ...
        "mun & conv"];
    if data.tipo == 1
        r1 = [r1 1];
        r2 = [r2 0];
        r3 = [r3 0];
        r4 = [r4 0];
    elseif data.tipo == 2
        r1 = [r1 0];
        r2 = [r2 1];
        r3 = [r3 0];
        r4 = [r4 0];
    elseif data.tipo == 3
        r1 = [r1 0];
        r2 = [r2 0];
        r3 = [r3 1];
        r4 = [r4 0];
    elseif data.tipo == 4
        r1 = [r1 0];
        r2 = [r2 0];
        r3 = [r3 0];
        r4 = [r4 1];
    end
    data_adapted = [data_adapted;r1;r2;r3;r4];
end
%% Export data
table_adapted = array2table(data_adapted);
table_adapted.Properties.VariableNames = ["mrun" "distancia" ...
    "p_prioritario" "simce_let" "simce_mat" "cod_nivel" "prioridad_h"...
    "es_mujer" "prioritario" "alto_rendimiento" "tipo" "alt"]

writetable(table_adapted,"data_p1_adapted.csv")

%% Adapting data P3
Info = readmatrix("data_P3.csv");

%%
data_adapted = [];
for bus = 0:1
    for cash = 0:1
        for week = 0:312
                record = Info(Info(:,1)==cash & Info(:,2)==bus & ...
                    Info(:,3)==week,:);
                disp(record)
                crimes = record(:,4);
                crimes = sum(sum(crimes));
                disp(crimes)
                data_adapted = [data_adapted;...
                    cash bus week crimes];
        end
    end
end

%%
table_adapted = array2table(data_adapted);
table_adapted.Properties.VariableNames = ["cash" "bus" "week" "crimes"];
writetable(table_adapted,"data_p3_adapted.csv");

%% Re adapting data P3
data_preadapt = readmatrix("data_p3_adapted.csv");
key_my = readmatrix("MYK.xlsx");
data_preadapt = [data_preadapt (1:size(data_preadapt,1))'];

controls = key_my(:, [3, 4]);
%%
control = [];
for i = 1:313
    code = strcat(num2str(controls(i,1)));
    code = str2num(code);
    control = [control; code];
    data_preadapt(data_preadapt(:,3) == (i-1), 5) = code;
end

names = ["cash" "bus" "week" "crimes" "m"];
for i=1:12
    data_preadapt = [data_preadapt, (data_preadapt(:,5) == i)];
    names = [names, strcat("control", num2str(i))]
end

names = [names, "street"];
control_crimes_street = data_preadapt(data_preadapt(:,2)==0,[1,3,4]);
data_preadapt = data_preadapt(data_preadapt(:,2)==1,:);

data_preadapt = [data_preadapt, (1:626)'];
for i = 1:626
    cash = control_crimes_street(i,1);
    week = control_crimes_street(i,2);
    data_preadapt(data_preadapt(:,1) == cash & ...
        data_preadapt(:,3) == week,18) = control_crimes_street(i,3);
end

%%
data_p3_adapted_v1 = array2table(data_preadapt);
data_p3_adapted_v1.Properties.VariableNames = names;
writetable(data_p3_adapted_v1,"data_p3_adapted_v1.csv");
