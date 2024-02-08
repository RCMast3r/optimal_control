beta = 0.5;
alpha = 0.5;
start_x = [1; 2];
x_vals = zeros(2, 20);
f_res_vals = zeros(1,20);
curr_x = start_x;

percent_diff_reach_index =0
set = false
for ind = 1:20

    if(f_x(start_x) - f_x(curr_x) < (.1*f_x(start_x)) & ~set)
        set=~set
        percent_diff_reach_index = ind
    end
    grad_res = grad_f(curr_x);
    x_vals(:,ind) = curr_x;
    
    if(grad_res == 0)
        break
        
    end
    k = 0;
    
    while( f_delta(curr_x, beta, k) <= (-alpha*(beta^k)*(norm(grad_f(curr_x))^2) ))
        k = k+1;
    end
    k
    curr_x = curr_x - (beta^k)*grad_f(curr_x);
    f_res_vals(ind) = f_x(curr_x);
end

disp("initial point x_0:")
start_x

final_x = curr_x;
disp("final point x_20:")
final_x
disp("90% reduction index for f of x:")
percent_diff_reach_index
plot(f_res_vals)

function f_x_delta = f_delta(x_i, beta_curr, k_curr)
    grad_result = grad_f(x_i)
    f_x_delta = ( f_x(x_i-((beta_curr^k_curr)*grad_result)) - f_x(x_i) )
end

function f_x_x_i = f_x(x_i)
    x_1 = x_i(2,1);
    x_2 = x_i(2,1);
    f_x_x_i = (x_1^4) - 2*(x_1^3) - (x_1^2)*x_2 -(x_2^3) - 4*x_1*(x_2^2) + 2*(x_2^2) + 4 + x_2^4;
end

function grad = grad_f(x_i)
    x_1 = x_i(1,1);
    x_2 = x_i(2,1);
    grad = [
            4*(x_1^3) - 6*(x_1^2) - 2*x_1*x_2 - 4*(x_2^2);
            -(x_1^2) - 3*(x_2^2)- 8*x_1*x_2 + 4*x_2 + 4*(x_2^3)
            ];
end

