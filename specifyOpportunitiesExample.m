%specifyOpportunitiesExample.m

%Specify the employment process.
employmentProcess=specifyEmploymentProcess(...
    'transitionRateIntoUnemployment',0.10,...
    'transitionRateOutOfUnemployment',0.90);

%Specify the moving average wage shocks.
movingAverageInnovation=specifyInnovation(...
    'mean',0,'variance',0.1^2,'supportLength',5);

movingAverage=specifyMovingAverage(...
    'coefficients',[1 -0.25],...
    'innovation',movingAverageInnovation);

%Specify the two innovations to the wage's perminant component.
%These must have the same support length.
permanentInnovationWhenEmployed=specifyInnovation(...
    'mean',0,'variance',0.17^2,'supportLength',5);

permanentInnovationWhenUnemployed=specifyInnovation(...
    'mean',0,'variance',0,'supportLength',5);

%Specify the wage process.
wageProcess=specifyWageProcess(...
    'movingAverage',movingAverage,...
    'permanentInnovationWhenEmployed',...
    permanentInnovationWhenEmployed,...
    'permanentInnovationWhenUnemployed',...
    permanentInnovationWhenUnemployed);

%Specify the earnings process.
earningsProcess=specifyEarningsProcess(...
    'employmentProcess',employmentProcess,...
    'wageProcess',wageProcess,...
    'unemploymentInsuranceReplacementRate',0.5);

%Complete the specification of market opportunities.
opportunities=specifyOpportunities(...
    'R',1.04,'delta',0.025,'pi',0.16,...
    'earningsProcess',earningsProcess);    