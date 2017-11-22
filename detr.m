function detR= detr(signal);
detR=[];
B= max(signal);
 for k=1:length(signal)
     if(signal(k) >= (B*0.7))
         detR(k) = signal(k);
     end
 end
    
end