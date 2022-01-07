function check_tregs(T,tregs)
 %%
 %     Author: Ying Wang, Min Li
 %     Create Time: 2021
 %     Copyright(c): 2020-2022 Ying Wang, yingwangrigel@gmail.com, Min Li, minli.231314@gmail.com
 %     Joint China-Cuba LAB, UESTC
 

num_level=size(tregs,1);
ispass=true;

for i=1:num_level
    if tregs{i}.opt.calc_musigma && tregs{i}.opt.calc_z
        func=@(y,mu,musigma,z) y-mu-sqrt(musigma).*z;
        item={T.(tregs{i}.resp{1}),...
            T.(tregs{i}.opt.resp_mu{1}),...
            T.(tregs{i}.opt.resp_musigma{1}),...
            T.(tregs{i}.opt.resp_z{1})};
        er=complexfun(@feval,'seperate',func,item{:});
        er=(real(er)).^2+(imag(er)).^2;
        ispass = ispass&&~any(er(:)>1e-6);
    else
        func=@(y,mu,eps) y-mu-eps;
        item={T.(tregs{i}.resp{1}),...
            T.(tregs{i}.opt.resp_mu{1}),...
            T.(tregs{i}.opt.resp_eps{1})};
        er=complexfun(@feval,'seperate',func,item{:});
        er=(real(er)).^2+(imag(er)).^2;
        ispass = ispass && ~any(er(:)>1e-6);
    end
end
if ~ispass
    error('test not pass,may due to too small bandwidth')
end
end


% 
% fpp=tregs{2}.regs{2}(1).fpp_yhat;
% fpp.Values=fpp.Values(:,:,100);
% plot_griddedInterpolant(fpp)
% 
% 
% 
% fpp=tregs{2}.regs{2}(2).fpp_yhat;
% fpp.Values=fpp.Values(:,:,1);
% plot_griddedInterpolant(fpp)
% 
% 
% 











