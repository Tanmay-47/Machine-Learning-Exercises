
a1 = [ones(size(X,1),1),X];
z2 = a1 * Theta1';

a2 = sigmoid(z2);
a2 = [ones(size(a2,1),1),a2];
z3 = a2 * Theta2';

a3 = sigmoid(z3);


yv = [1:num_labels] == y;
t1 = -1 * yv .* log(a3);
t2 = (1-yv) .* log(1-a3);

J = sum(t1 - t2)/m;


%{
%te1 = [ones(size(Theta1,1),1),Theta1(:,2:end)];
%te2 = [ones(size(Theta2,1),1),Theta2(:,2:end)];
te1 = Theta1;
te2 = Theta2;
te1 = te1(:);
te2 = te2(:);

te1 = te1.^2;
te1 = sum(te1);

te2 = te2.^2;
te2 = sum(te2);
vv = (te1 + te2)/(2*m);
%}