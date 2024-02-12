###Q Here we are importing three csv files.

#Q1 who prefer energy drinks more?

select gender,count(Respondent_ID) as total_respondents
from dim_repondents
group by gender 
order by total_respondents desc;

#Q2 # Which age group prefers energy drinks more?

select age, count(Respondent_ID) total_respondents
from dim_repondents
group by age
order by total_respondents desc;

# Which type of marketing reaches the most Youth (15-30)?

select Marketing_channels,count(Respondent_ID) as total_respondants
from fact_survey_responses 
group by Marketing_channels
order by total_respondants desc;

# Which type of marketing reaches the most Youth (15-30)?
#Consumer Overview
select Marketing_channels,count(Respondent_ID) as total_respondants
from fact_survey_responses 
group by Marketing_channels
order by total_respondants desc;

#What packaging preferences do respondents have for energy drinks?

select packaging_preference,count(Respondent_ID) as total_respondants
from fact_survey_responses
group by Packaging_preference
order by total_respondants desc;

#Who are the current market leaders?

select current_brands,count(respondent_id) as total_respondents
from fact_survey_responses
group by Current_brands
order by total_respondents desc;

#What are the primary reasons consumers prefer those brands over ours?

with cte as
(select current_brands,count(respondent_id) as total_respondents
from fact_survey_responses
group by Current_brands
order by total_respondents desc
)
select cte. current_brands,f.reasons_for_choosing_brands,
count(respondent_id) as total_respondents
from fact_survey_responses f
join cte
on f.Current_brands = cte.Current_brands
group by  cte.current_brands,
f.reasons_for_choosing_brands
order by total_respondents desc;

# Which marketing channel can be used to reach more customers?

select marketing_channels, count(respondent_id) as total_responses
from fact_survey_responses
group by Marketing_channels
order by total_responses desc;

#How effective are different marketing strategies and channels in reaching our customers?

#What do people think about our brand? (overall rating)?
select Current_brands as brand_name,Brand_perception,count(Brand_perception) as feedback_count,
round(100*count(Brand_perception)/sum(count(Brand_perception)) over(), 2) as rating
from fact_survey_responses
where Current_brands = "codex"
group by brand_perception
order by feedback_count desc;

# Which cities do we need to focus more on?

select count(dr.respondent_id) as total_respondents,dc.city,f.Current_brands
from dim_repondents dr
join dim_cities dc
on dr.City_ID = dc. City_ID
join fact_survey_responses f
on f.Respondent_ID = dr.Respondent_ID
where f.Current_brands = "codex"
group by dc.city 
order by total_respondents asc;

#Where do respondents prefer to purchase energy drinks?

select purchase_location,count(Respondent_ID) as total_count
from fact_survey_responses
group by Purchase_location
order by total_count desc;

#What are the typical consumption situations for energy drinks among respondents?

select typical_consumption_situations,count(respondent_id) as total_respondents
from fact_survey_responses
group by typical_consumption_situations 
order by total_respondents desc;

#What factors influence respondents' purchase decisions, such as price range and limited edition packaging?

select price_range,count(respondent_id) as total_respondents
from fact_survey_responses
group by price_range,limited_edition_packaging
order by  total_respondents desc;

select Limited_edition_packaging,count(respondent_id) as total_respondents
from fact_survey_responses
group by Limited_edition_packaging
order by total_respondents desc;

select Health_concerns,count(Respondent_ID) as total_respondents
from fact_survey_responses
group by Health_concerns
order by total_respondents desc;

select General_perception, count(Respondent_ID) as total_respondents
from fact_survey_responses
group by General_perception
order by total_respondents desc;

#Which area of business should we focus more on our product development?

select count(respondent_id) as total_respondents,reasons_for_choosing_brands
from fact_survey_responses
where Current_brands = "codex"
group by Reasons_for_choosing_brands
order by total_respondents asc ;









