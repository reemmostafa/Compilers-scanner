function timestamps = missingbeats(Data,N);
T=(1/256); 
squ= [];
%noise filtering (notch filter) 
nf = fir1(100,[0.36,0.41],'stop');
y= filter(nf,1,Data);
%plot(y)
%noise filtering (Band-pass filter)
bpf = fir1(100,[(0.1/128),0.3515625],'bandpass');
x= filter(bpf,1,y);
%plot(x);
% diffrentatiated signal
sum = differentiate(T,x);
%plot(sum(1:2000));
%squaring 
for i= 1: length(sum)
    squ(i) = power(sum(i),2);
end
%plot(squ(1:2000));
%smoothng 
signal = smoothing(N,squ);
% detecting R
det=detr(signal);% threshold & which above threshold
[maxpoints] = peakdet(det, 20);% R
 plot(signal);hold on;
 plot(maxpoints(:,1), maxpoints(:,2), 'r*');
%[maxpoints2] = peakdet(det, 20);
maxpoints =maxpoints*T;
RR=[];
 for k=2:length(maxpoints)
    RR(k-1)= (maxpoints(k,1) - maxpoints(k-1,1));
    maxtab2(k-1,3) = RR(k-1);
 end
figure;
plot(RR);
 %find missing heart beats
 mbeats=[];
 count=1;
 for  i = 1: length(maxpoints)-1
     if(RR(i) > 1.1)
         mbeats(count) = i;
         count= count+1;
     end
 end
 timestamp=[];
 for i= 1: length(mbeats)
     timestamp(i) = (maxpoints(mbeats(i)+1) + maxpoints(mbeats(i)))/2;
 end
 fid = fopen( 'MissingBeats.txt','w' );
 fprintf(fid,'%f,%f,%f,%f\n',timestamp(1,:));
 fclose(fid);
end