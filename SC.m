function [CONSX,U,a]=SC(X,D)
% X为一维向量 D为对应X的字典集合
% CONSX为重构X U为膜电势 a为活跃系数
dimension=size(D);
neuroNum=dimension(2);
U(1:neuroNum)=0;
a(1:neuroNum)=0;
% 字典的数值转换（二值）字典
% for k=1:20
%    for l=1:25
%        if D(l,k)==0;
%            D(l,k)=1;
%        else D(l,k)=0;
%        end
%    end
% end
    j=[];
for m=1:60;
   M(m,:)=U;
   j(1,m)=m; 
   CONSX=D*a';
   U=(X-CONSX)'*D+U+a;
   s=X'*D;
   for i=1:20;%阈值函数
      if U(1,i)>=40
         a(1,i)=(U(1,i)-40)/m;
      else a(1,i)=0;
      end     
  
   end
end
 CONSX=D*a';
 set(gca, 'FontName', 'Times New Roman','FontSize',10,'FontWeight','bold');
 plot(j,M(:,1),'-ro',j,M(:,2),'-go',j,M(:,3),'-bo',j,M(:,4),'-yo',...
        j,M(:,5),'-r*',j,M(:,6),'-g*',j,M(:,7),'-b*',j,M(:,8),'-y*'...
        ,j,M(:,9),'-r+',j,M(:,10),'-g+',j,M(:,11),'-b+',j,M(:,12),'-y+'...
      ,j,M(:,13),'-r<',j,M(:,14),'-g<',j,M(:,15),'-b<',j,M(:,16),'-y<'...
       ,j,M(:,17),'-rsquare',j,M(:,18),'-gsquare',j,M(:,19),'-bsquare',j,M(:,20),'-ysquare');
    xlabel('迭代次数');
    ylabel('电势 u');
    title('迭代电势散点图');
    legend('U(:,1)','U(:,2)','U(:,3)','U(:,4)','U(:,5)',...
        'U(:,6)','U(:,7)','U(:,8)','U(:,9)','U(:,10)',...
        'U(:,11)','U(:,12)','U(:,13)','U(:,14)','U(:,15)',...
        'U(:,16)','U(:,17)','U(:,18)','U(:,19)','U(:,20)');
end