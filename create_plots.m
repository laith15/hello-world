close all
clear all;

nn1 = [6,10,20];
nn2 = [6,10,14];

N1 = log(2.^nn1);
N2 = log(2.^nn2);

%data in format of serial -> fast parallel -> optimal
sum_dat = [ 5.38, 26.7, 27500,
    3.74, 3.88, 216,
    5.07, 20.4, 21300];

mv_dat = [6.57, 1560, 424000,
    12.1, 1280, 289000,
    9.94, 897, 194000];

for i=1:2
    sum_SU(i,:) = sum_dat(3,:) ./ sum_dat(i,:);
    sum_EF(i,:) = sum_SU(i,:)/8;    
end

for i=2:3
    mv_SU(i-1,:) = mv_dat(1,:) ./ mv_dat(i,:);
    mv_EF(i-1,:) = mv_SU(i-1,:)/8;   
    
end

figure(11); 
xlabel('log(n)'); ylabel('speed-up'); title('Speed-up for summation');
figure (12); xlabel('log(n)'); ylabel('speed-up'); title('Efficiency for summation');
figure(21); xlabel('log(n)'); ylabel('microseconds'); title('Speed-up: Matrix vector multiplication');
figure(22); xlabel('log(n)'); ylabel('microseconds'); title('Efficiency: Matrix vector multiplication');

for k=1:2
    
   figure(11); hold on;
   plot(N1,sum_SU(k,:),'linewidth',1.5);
   figure(12); hold on;
   plot(N1,sum_EF(k,:),'linewidth',1.5);
   
   figure(21); hold on;
   plot(N1,mv_SU(k,:),'linewidth',1.5);
   figure(22); hold on;
   plot(N1,mv_EF(k,:),'linewidth',1.5);
   
   if k==2,
       figure(11);legend({'fast-parallel','cost-optimal'}); a = legend('show');  set(a,'Location','Best'); set(gca,'Fontsize',12);
       figure(12);legend({'fast-parallel','cost-optimal'}); b = legend('show'); set(a,'Location','Best'); set(gca,'Fontsize',12); 
       figure(21);legend({'fast-parallel','cost-optimal'}); c = legend('show');  set(a,'Location','Best'); set(gca,'Fontsize',12); 
       figure(22);legend({'fast-parallel','cost-optimal'}); d = legend('show'); set(a,'Location','Best'); set(gca,'Fontsize',12); 
   end
   
end

saveas(figure(11),'speedup_sum.pdf');
saveas(figure(12),'eff_sum.pdf');
saveas(figure(21),'speedup_mv.pdf');
saveas(figure(22),'eff_mv.pdf');









