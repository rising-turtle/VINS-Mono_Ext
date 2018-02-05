function analyze_data( fdir )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if nargin == 0
    fdir = './VINS-Mono_ext/ETAS_2F_640_30'; 
    fdir = './VINS-Mono_ext/ETAS_4F_640_30'; 
    fdir = './VINS-Mono_ext/ETAS_F2_640_30/vins_kf'; 
    fdir = './VINS-Mono_ext/ETAS_F4_640_30'; 
    fdir = './VINS-Mono/ETAS_2F_640_30'; 
    fdir = './VINS-Mono/ETAS_4F_640_30';
    fdir = './VINS-Mono/ETAS_F2_640_30'; 
    fdir = './VINS-Mono/ETAS_F4_640_30';
end

ev = []

for i=1:10
    fname = strcat('/run_',int2str(i));
    fname = strcat(fname, '.csv');
    fname = strcat(fdir, fname);
    fid = fopen(fname);
    col = textscan(fid, '%s', 'delimiter', '\n');
    lines = col{1};
    N = size(lines,1);
    line = lines{N};
    
    data = textscan(line, '%f %f %f %f\n', 'delimiter', ','); 
    e = [data{2}, data{3}, data{4}];
    ev = [ev; norm(e)];
end

fprintf('%s has mean %f std %f min: %f max: %f\n', fdir, mean(ev), std(ev), ...
            min(ev), max(ev));


end

