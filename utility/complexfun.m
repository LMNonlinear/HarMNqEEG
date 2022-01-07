function y=complexfun(xfun,method,func,varargin)
% xfun= @feval @tablefun @cellfun @arrayfun @bsxfun  
% method=  'seperate' 'abs' 'complex'


% method='seperate';
% x=[2+2i,2];
% y=[2+2i,2];
% z1=real(x)./real(y)+1i*(imag(x)./imag(y))
% z2=real(x)./(real(y)+eps)+1i*(imag(x)./(imag(y)+eps))
% 
% func=@(x,y) x/(y+eps)
% z3 = complexfun(@feval,method,func,x,y)
% assert(prod(z3==z2))
% 
% 
% A = table([0.71;-2.05;-0.35;-0.82;1.57]+1i*[0.71;-2.05;-0.35;-0.82;1.57],...
% [0.23;0.12;-0.18;0.23;0.41]+1i*[0.23;0.12;-0.18;0.23;0.41]);
% func=@(x,y) x-y
% T = complexfun(@tablefun,'seperate',func,A,'result',[],'Var1','Var2')
 %%
 %     Author: Ying Wang, Min Li
 %     Create Time: 2021
 %     Copyright(c): 2020-2022 Ying Wang, yingwangrigel@gmail.com, Min Li, minli.231314@gmail.com
 %     Joint China-Cuba LAB, UESTC
 

if isempty(method)
    method='complex';
end

switch method
    case 'seperate' %caution add eps when divide only real/imag number
        funcsym=sym(func);
        % By default, when you convert symbolic expressions, the order is
        % alphabetical. When you convert symbolic functions, their input
        % arguments appear in front of other variables, and all other
        % variables are sorted alphabetically.
        %vars=symvar(funcsym); symvar change the order of vars with
        vars=sym(get_handlevar(func));
        funcreal=subs(funcsym,vars,real(vars));
        funcimag=subs(funcsym,vars,imag(vars));
        funcsym=funcreal+1i*funcimag;
        func=matlabFunction(funcsym, 'vars',vars);
        y=xfun(func,varargin{:});
    case 'abs'
        funcsym=sym(func);
        vars=symvar(funcsym);
        funcsym=subs(funcsym,vars,abs(vars));
        func=matlabFunction(funcsym, 'vars',vars);
        y=xfun(func,varargin{:});
    case 'complex'
        y=xfun(func,varargin{:});
    otherwise
        error('not support method with complexfun')
end

end










