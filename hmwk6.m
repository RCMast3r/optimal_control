syms s11 s12 s21 s22
S = [s11, s12;
      s21, s22  ];
A=[-2, 1; -1, 1]
B = [1; 0.5];
r = 1;
Q = [2, -1; -1, 0.5];
eqn = S*B*(r^-1)*B.'*S-S*A-A.'*S-Q == 0

[s1, s2, s3, s4] = solve(eqn, s11, s12, s21, s22)
s_11 = double(s1)
s_12 = double(s2)
s_21 = double(s3)
s_22 = double(s4)

matrices = cell(1, length(s_11));
for i=1:length(s_11)
    matrices{i} = [s_11(i), s_12(i); s_21(i), s_22(i)];
end

% TODO determine if S is positive-semi definite

for i = 1:length(s_11)
    disp(['Matrix ', num2str(i), ':']);
    disp(matrices{i});
    tf = issymmetric(matrices{i});
    d = eig(matrices{i});
    tol = length(d)*eps(max(d));
    issemidef = all(d > -tol);

    if tf & issemidef
        disp('Matrix is symmetric positive semi-definite.')
    end
    
end

