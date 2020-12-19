p = 2;
X_poly = [ones(size(X))]
for i = 1:p,
	X_poly = [X_poly,X.^i]
end;

X_poly = X_poly(:,2:end)