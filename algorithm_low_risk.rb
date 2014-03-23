
require 'pry'

@humidity = (5.00/100.00)
@wind = 5.0
@pop = 50.0

 params = {"country"=>"Canada",
 "city"=>"Calgary",
 "length"=>"back-length+",
 "curliness"=>"curly",
 "hygiene"=>"today",
 "recent haircut"=>"recent haircut",
 "controller"=>"pages",
 "action"=>"results"}
# <------- below are the definition for how much a particular hair quality counts in the algorithm -------->
length_score = {'no hair' => 0.0, 'very short' => 1.0, 'short' => 2.0, 'jaw-length' => 3.0, 'shoulder-length' => 4.0, 'back-length+' => 5.0}
curliness_score = {'straight'=> 3.0, 'wavy' => 4.0, 'curly' => 5, 'afro' => 2.0}
hygiene_score = {'today' => 1, 'yesterday' => 2.0, 'days ago' => 5, 'can’t remember' => 10.0}
modification_score = {'recent haircut' => -10.0, 'hair product' => -5, 'perm' => 5.0,  'dye'=> 5.0, 'highlights' => 5.0} 

if params["length"] == "no hair"
  @bad_hair_prediction = "You have no hair. What kind of a prediction did you expect me to give?"

else
# <-------The following section calculates a humidity score. --------------------------------->
# Optimum humidity is defined as 0.30. Equal to or over 0.30, users incure a humidity multiplier. Under 0.30, users incure a static electricity mutliplier.
# Hair curliness incures 50% more humidity risk than other hair elements.
# if statement == humidity multiplier
# else statement == static electricity multiplier.

  if @humidity >= 0.30
    humidity_curl_risk = (@humidity * 1.5) + 1.0
    
  else
    humidity_curl_risk = ((0.60 - @humidity) * 1.5) + 1.0
          
  end
  
  humidity_other_risk = @humidity + 1.0
  hum_curl_score = curliness_score[params["curliness"]]  * (humidity_curl_risk) 
  hum_other_score =  (length_score[params["length"]] + hygiene_score[params["hygiene"]]) * humidity_other_risk
  puts "Your humidity-curliness score is #{hum_curl_score}"
  puts "Your humidity-other score is #{hum_other_score}"

# <-------The following section calculates a wind score  --------------------------------->
# Optimum wind is defined as 0.0kph. For each increment above 0.0, users incure a wind multiplier.
# The wind divisor ((@wind/2.0)/10.0) normalises the risk score to humidity.
# Hair length incures 50% more wind risk than other hair elements.
  if @wind == 0.0
    wind_length_score = 0.0
    wind_other_score = 0.0
  else
    wind_length_risk = ((@wind/2.0)/10.0)
    
    if @wind <= 10
      wind_other_risk = 0.0

    else 
      wind_other_risk = ((@wind/2.0)/10.0)/2
    end
    wind_length_score = length_score[params["length"]]  * (wind_length_risk) 
    wind_other_score = (curliness_score[params["curliness"]] + hygiene_score[params["hygiene"]]) * wind_other_risk
    puts "Your wind-length score is #{wind_length_score}"
    puts "Your wind-other score is #{wind_other_score}"
  end
# <-------The following section calculates a P.O.P. score. P.O.P. multiplies equaly across all hair qualities  ------------------>
# The pop divisor (@pop/40) normalises the pop risk to humidity and length risks.
  
  pop_score = (curliness_score[params["curliness"]] + hygiene_score[params["hygiene"]] + length_score[params["length"]]) * (@pop/40)
  puts "Your P.O.P. score is #{pop_score}"


# <-------The following section calculates overall bad hair day risk score  --------------------------------->
  # user_badhair_score = hum_curl + hum_else + wind_length + length_else + percip + params[:modifications]

# <-------Bad hair day prediction below  --------------------------------->
  if @wind < 5.0 && @humidity > 0.275 && @humidity < 0.325 && @pop == 0.0
    @bad_hair_prediction = "Today the weather is perfect for hair."
  elsif @wind < 5.0 && @humidity > 0.275 && @humidity < 0.325 && @hygiene =='can’t remember' && @pop == 0.0
    @bad_hair_prediction = "Today the weather is perfect for hair... If you washed your hair more, you'd be in for a great hair day."
  else
    "Some other shit"
  end
end
















