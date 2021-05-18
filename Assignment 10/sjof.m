
load twotankdata
z = iddata(y, u, 0.2, 'Name', 'Two tank system');
z1 = z(1:1000);
z2 = z(1001:2000);
z3 = z(2001:3000);
plot(z1,z2,z3)
legend('Estimation','Validation 1', 'Validation 2')
savefig("rawData.png")
%%
V = arxstruc(z1,z2,struc(1:5, 1:5,1:5));
% select best order by Akaike's information criterion (AIC)
%nn = selstruc(V,'aic')
nn = [1 1 1];

%%
mw1 = nlarx(z1,nn, wavenet);
mw2 = nlarx(z1,nn, wavenet('Number', 8 ))
compare(z1,mw1, mw2);
%%
NLFcn = mw1.Nonlinearity
mw2.InputName
mw2.OutputName
getreg(mw2)
%%
mlin = arx(z1,nn);
compare(z1,mlin,mw2)
compare(z2,mlin,mw2)
compare(z3,mlin,mw2)
resid(z2,mlin,mw2)
legend show
plot(mw2) % plot nonlinearity response as a function of selected regressors
%%
ms1 = nlarx(z1, nn, sigmoidnet('Number', 8))
compare(z1,ms1)
compare(z2,ms1);
mt1 = nlarx(z1,nn, treepartition)

compare(z1, ms1, mt1)
mhw1 = nlhw(z1, nn, pwlinear, pwlinear) % watch out at the definition of the regressors
compare(z1,mhw1)
plot(mhw1)
mhw1.InputNonlinearity.BreakPoints
%%

%%
mhw2 = nlhw(z1, nn, deadzone, saturation);
mhw3 = nlhw(z1, nn, 'deadzone', unitgain); % no output nonlinearity
mhw4 = nlhw(z1, nn, [], 'saturation'); % no input nonlinearity
compare(z1,mhw2)
mhw2.InputNonlinearity.ZeroInterval
mhw2.OutputNonlinearity.LinearInterval
%%
opt = nlhwOptions();
opt.SearchMethod = 'gna';
opt.SearchOptions.MaxIterations = 7;
mhw6 = nlhw(z1, nn, deadzone, saturation, opt);
opt.SearchOptions.MaxIterations = 30;
mhw7 = nlhw(z1, mhw6, opt);
compare(z1, mhw6, mhw7)
