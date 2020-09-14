clc;
clear all;
s=[0:3]; %QPSK
%s=[0:15]; %16-QAM
%s=[0:255]; %256-QAM


s1=de2bi(s,2,'left-msb'); %QPSK
%s1=de2bi(s,4,'left-msb'); %16-QAM
% s1=de2bi(s,8,'left-msb'); %256QAM


k=1;
%mengubah bentuk matriks menjadi 1 baris
for i =1 : size(s1, 1) %iterasi i sebanyak baris
    for j=1: size (s1, 2) %iterasi j sebanyak kolom
        s2(k)=s1(i,j);
        k=k+1;
    end
end


x=[];
% %........................Untuk QPSK.................................
for i=1:2:length(s2)
    x(end+1,1)=((1-2*(s2(i)))+sqrt(-1)*(1-2*s2(i+1)));%/sqrt(2); %mapping
end
%y=x.*conj(x)/conj(-x);
% y(1)=x(1);
% y(2)=x(2);
% y(3)=conj(x(3));
% y(4)=conj(x(4));
% z= reshape(y,[4,1]);

%......................Untuk 16-QAM...................................
% for i=1:4:length(s2) 
%      x(end+1,1)=((1-2*(s2(i)))*(2-(1-2*(s2(i+2))))+...
%      sqrt(-1)*(1-2*(s2(i+1)))*(2-(1-2*(s2(i+3)))))/sqrt(10);
% end
% plot (x, 'o', 'linewidth', 1); axis([-5 5 -5 5]);

% ...................Untuk 256 QAM....................................
% for i=1:8:length(s2)
%     x(end+1,1)=((1-2*(s2(i)))*(8-(1-2*(s2(i+2)))*(4-(1-2*(s2(i+4)))*(2-(1-2*(s2(i+6))))))+sqrt(-1)*(1-2*(s2(i+1)))*(8-(1-2*(s2(i+3)))*(4-(1-2*(s2(i+5)))*(2-(1-2*(s2(i+7)))))));%/sqrt(170);
% 
% end

%.....................................................................
plot (x, 'o'); axis([-3 3 -3 3]); %QPSK
%plot (x, '.'); axis([-16 16 -16 16]); %256-QAM

%......................................................................
% for i=1:length(s)
%     text((real(x(i))-0.9), (imag(x(i))-0.4), mat2str(s1(i,:)),
%     'FontSize', 6); %memposisikan bit string (256-qam)
% end
for i=1:length(s)
    text((real(x(i))-0.2), (imag(x(i))-0.4), mat2str(s1(i,:)), 'FontSize', 10); %memposisikan bit string (QPSK)
end
grid on;
xlabel('In-phase');
ylabel('Quadrature');