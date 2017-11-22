%fs = 256; f0= ??;fn= fs/2;freqRatio= f0/fn;
T=(1/256);
N=25;
%subplot(2,1,1)
%plot(DataN(1:2000));
%notch filter
nf = fir1(100,[0.36,0.41],'stop');
y= filter(nf,1,DataN);
%plot(y(1:2000));
%Band-pass filter
bpf = fir1(100,[(0.1/128),0.3515625],'bandpass');
x= filter(bpf,1,y);
%subplot(2,1,2) 
%plot (x(1:2000));
% diffrentiation -> implementation file (differentiate.m)
sum = differentiate(T,x);
%plot(sum(1:2000));
% squaring
squ= [];
for i= 1: length(sum)
    squ(i) = power(sum(i),2);
end
%plot(squ(1:2000));
%smoothing the signal ->implementaion file (smoothing.m)
signal = smoothing(N,squ);
figure;
plot(signal(1:2000));
hold on;
% detr -> function to detect thressold & points above the threshold
det=detr(signal);
[maxpoints] = peakdet(det(1:2000), 6);
plot(maxpoints(:,1), maxpoints(:,2), 'r*');
hold on;
%calculating RR intervals
RR=[];
[maxpoints] = peakdet(det, 2.5);
for k=2:length(maxpoints)
    RR(k-1)= (T*maxpoints(k,1) - T*maxpoints(k-1,1));
 end
%plot(RR*1000);
 