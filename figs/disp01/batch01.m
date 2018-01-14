
for kk = [20 37 50]
for ss = [1 2]

disp01k;
k = kk;s=ss;
disp01motion;

figure(fig1)
fname = strcat(['disp_k' num2str(k) '_c0' num2str(s) '.eps'])
print('-deps',fname)

figure(fig3)
fname = strcat(['mot_k' num2str(k) '_c0' num2str(s) '.eps'])
print('-deps',fname)

close all;

end
end
