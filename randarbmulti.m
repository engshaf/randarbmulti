function f = randarbmulti(x,y,N)
% RANDARBMULTI generates N random numbers from an arbitrary PDF, defined by
% vectors x and y.  Modified from randarb.m (Dave Dykes) at:
% http://www.mathworks.com/matlabcentral/fileexchange/6506-obs-from-arbitrary-pdf
%
% Jack Peterson (jack@tinybike.net), 4/21/2013

cdf_y = cumsum(y);
sum_y = sum(y);

for j = 1:N
	
	% Compute a uniform random number between 0 and sum(y)
	randx = sum_y*rand();
	
	% Find where the number lies on a conceptual line comprised of "segments" of
	% length y
	i = 1;
	while cdf_y(i) < randx
		i = i + 1;
	end
	
	% Return the x value corresponding to the y value we "landed on."
	f(j) = x(i);
	
end