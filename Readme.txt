Differentiate function -> (diffrentiate.m file)
	differentaiate((1/f),filtered signal);
	to overcome baseline drifts is to differentiate the ECG signal.
	this function use the 5-point difference equation y(nT) =(1/8T)[-x(nT-2T)-2x(nT-T)+2x(nT+T)+x(nT+2T)].

**Square the derivative (output of differentiate function)
	y(nT)=[x(nT)]^2.

**Smoothing function -> (smoothing.m file)
	smoothing(N,squaed signal);
	smooth the squared signal using moving average window.
	where N is the number of samples in the width of the moving average window.

**Detect the threshold & the point above it-> (detr.m file)
	detr(signal); % signais the output signal from the smoothing function
	threshold is detected by taking a % from the max value

** Detect the Peak from the point above threshold -> (peakdet.m file)
	peakdet(array of point above threshold,delta);
		
**calculating th RR intervals which is the difference between the R peaks
	RRi=t(i)-t(i-1).

**ploting th RR show heart rate variability (HRV).

************************************************************************************************************************

**finding missing beats function -> (missingbeats.m file)
	missingbeats(Data,N); % Data (ECG signal to process) % N (the moving average window size N).
	The function return the timestamps of missing beats -> output file (MissingBeats.txt)
	the missing beats is cleary recognaized from the HRV graph where a large RR interval is detected. 

