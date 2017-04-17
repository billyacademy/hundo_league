# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
players2014 = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2014&format=json")
players2014['players'].each do |player|
  if Player.exists?(:player_id => player['id'])
  else
    new_player = Player.new(
        player_id:player['id'],
        esbid:player['esbid'],
        gsisPlayerId:player['gsisPlayerId'],
        name:player['name'],
        position:player['position'],
        teamAbbr:player['teamAbbr'],
        stats_id:nil
    )
    new_player.save
  end
end

players2015 = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2015&format=json")
players2015['players'].each do |player|
  if Player.exists?(:player_id => player['id'])
  else
    new_player = Player.new(
        player_id:player['id'],
        esbid:player['esbid'],
        gsisPlayerId:player['gsisPlayerId'],
        name:player['name'],
        position:player['position'],
        teamAbbr:player['teamAbbr'],
        stats_id:nil
    )
    new_player.save
  end
end

players2016 = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&format=json")
players2016['players'].each do |player|
  if Player.exists?(:player_id => player['id'])
  else
    new_player = Player.new(
        player_id:player['id'],
        esbid:player['esbid'],
        gsisPlayerId:player['gsisPlayerId'],
        name:player['name'],
        position:player['position'],
        teamAbbr:player['teamAbbr'],
        stats_id:nil
    )
    new_player.save
  end
end


JONO = {email:'jono.baumann@gmail.com', team_name:'Bye Weekers'}
BILLY = {email:'klone182@gmail.com', team_name:'Thud Butt and The Lost Boys'}
BRENDAN = {email:'brendm13@gmail.com', team_name:'I\'m Selling'}
JUSTIN = {email:'baumann1385@gmail.com', team_name:'JayAjayaJay AjayaJayAjayai'}
ROB = {email:'robertjcohoon@gmail.com', team_name:'Bring on the Browns!'}
NATE = {email:'ndalke@gmail.com', team_name:'There\'s Always Next Year'}
DAN = {email:'dschlauch@gmail.com', team_name:'Jamaica Plain Pediatrics'}
ALEX = {email:'amac12454@gmail.com', team_name:'Medford Humps'}
ADAM = {email:'ajtapply@gmail.com', team_name:'Jefferson Slaveship'}
BARD = {email:'bradleyshill@gmail.com', team_name:'The Bardy Bunch'}
DEREK = {email:'deek462@yahoo.com', team_name:'Mr Pinkfinger'}
FISCHETTI = {email:'stephen.fischetti@gmail.com', team_name:'Like A Grape'}
GOAT = {email:'decker.stephen.g@gmail.com', team_name:'The Real McCoy'}
PEALER = {email:'shortbussubsidiary@gmail.com', team_name:'Cleveland Browns'}

TWENTY_FOURTEEN = 2014
TWENTY_FIFTEEN = 2015
TWENTY_SIXTEEN = 2016

INITIAL = 'Initial Contract'
FOUR = 'Four Year Extension'
THREE = 'Three Year Extension'
TWO = 'Two Year Extension'
QO = 'Qualifying Offer'
FIRST = 'First Year'
FRANCHISE = 'Franchise'


ContractType.create(name: 'Two Year Extension' , length:2)
ContractType.create(name: 'Three Year Extension' , length:3)
ContractType.create(name: 'Four Year Extension' , length:4)
ContractType.create(name: 'Initial Contract' , length:2)
ContractType.create(name: 'Qualifying Offer' , length:1)
ContractType.create(name: 'First Year' , length:1)
ContractType.create(name: 'Franchise' , length:1)

Owner.create(first_name:'Billy', last_name:'Mahoney', email:'klone182@gmail.com')
Owner.create(first_name:'Brendan', last_name:'Mercier', email:'brendm13@gmail.com')
Owner.create(first_name:'Justin', last_name: 'Baumann', email:'baumann1385@gmail.com')
Owner.create(first_name:'Jono', last_name:'Baumann', email:'jono.baumann@gmail.com')
Owner.create(first_name:'Rob', last_name:'Cohoon', email:'robertjcohoon@gmail.com')
Owner.create(first_name:'Nate', last_name:'Dalke', email:'ndalke@gmail.com')
Owner.create(first_name:'Dan', last_name: 'Schlauch', email:'dschlauch@gmail.com')
Owner.create(first_name:'Alex', last_name:'MacDonald', email:'amac12454@gmail.com')
Owner.create(first_name:'Adam', last_name:'Tapply', email:'ajtapply@gmail.com')
Owner.create(first_name:'Bard', last_name:'Hill', email:'bradleyshill@gmail.com')
Owner.create(first_name:'Derek', last_name:'Boisvert', email:'deek462@yahoo.com')
Owner.create(first_name:'Steve', last_name:'Fischetti', email:'stephen.fischetti@gmail.com')
Owner.create(first_name:'Steve', last_name:'Decker', email:'decker.stephen.g@gmail.com')
Owner.create(first_name:'Michael', last_name:'Pealer', email:'shortbussubsidiary@gmail.com')

DynastyTeam.create(owner_id: Owner.where(email:'klone182@gmail.com').first().id, team_name:'Thud Butt and The Lost Boys')
DynastyTeam.create(owner_id: Owner.where(email:'brendm13@gmail.com').first().id, team_name:'I\'m Selling')
DynastyTeam.create(owner_id: Owner.where(email:'baumann1385@gmail.com').first().id, team_name:'JayAjayaJay AjayaJayAjayai')
DynastyTeam.create(owner_id: Owner.where(email:'jono.baumann@gmail.com').first().id, team_name:'Bye Weekers')
DynastyTeam.create(owner_id: Owner.where(email:'robertjcohoon@gmail.com').first().id, team_name:'Bring on the Browns!')
DynastyTeam.create(owner_id: Owner.where(email:'ndalke@gmail.com').first().id, team_name:'There\'s Always Next Year')
DynastyTeam.create(owner_id: Owner.where(email:'dschlauch@gmail.com').first().id, team_name:'Jamaica Plain Pediatrics')
DynastyTeam.create(owner_id: Owner.where(email:'amac12454@gmail.com').first().id, team_name:'Medford Humps')
DynastyTeam.create(owner_id: Owner.where(email:'ajtapply@gmail.com').first().id, team_name:'Jefferson Slaveship')
DynastyTeam.create(owner_id: Owner.where(email:'bradleyshill@gmail.com').first().id, team_name:'The Bardy Bunch')
DynastyTeam.create(owner_id: Owner.where(email:'deek462@yahoo.com').first().id, team_name:'Mr Pinkfinger')
DynastyTeam.create(owner_id: Owner.where(email:'stephen.fischetti@gmail.com').first().id, team_name:'Like A Grape')
DynastyTeam.create(owner_id: Owner.where(email:'decker.stephen.g@gmail.com').first().id, team_name:'The Real McCoy')
DynastyTeam.create(owner_id: Owner.where(email:'shortbussubsidiary@gmail.com').first().id, team_name:'Cleveland Browns')

#no stevie
billy_player_array = [2556075, 2543499, 2495328, 2533039, 2543498, 497284, 497240, 2495469,
                      100024, 2553895, 2506467, 284, 2507855, 2495143, 2346, 2555348, 2533436,
                      925, 2555415, 2552374, 2543457]
#Derek Carr
PlayerContract.create(player_id: Player.where(player_id:2543499).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)
#Derrick Henry
PlayerContract.create(player_id: Player.where(player_id:2556075).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)
#Bilal Powell
PlayerContract.create(player_id: Player.where(player_id:2495328).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Alshon Jeffery
PlayerContract.create(player_id: Player.where(player_id:2533039).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)
#Brandin Cooks
PlayerContract.create(player_id: Player.where(player_id:2543498).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:33)
#Eric Decker
PlayerContract.create(player_id: Player.where(player_id:497284).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:13)
#Rob Gronkowski
PlayerContract.create(player_id: Player.where(player_id:497240).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:62)
#Dion Lewis
PlayerContract.create(player_id: Player.where(player_id:2495469).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:7)

#Jets
PlayerContract.create(player_id: Player.where(player_id:100024).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Adam Humphries
PlayerContract.create(player_id: Player.where(player_id:2553895).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Darren Sproles
PlayerContract.create(player_id: Player.where(player_id:2506467).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:12)

#Darren McFadden
PlayerContract.create(player_id: Player.where(player_id:284).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Victor Cruz
PlayerContract.create(player_id: Player.where(player_id:2507855).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Stevie Johnson
PlayerContract.create(player_id: Player.where(player_id:768).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)
#Andy Dalton
PlayerContract.create(player_id: Player.where(player_id:2495143).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)
#Pierre Garcon
PlayerContract.create(player_id: Player.where(player_id:2346).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:19)
#Braxton Miller
PlayerContract.create(player_id: Player.where(player_id:2555348).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Brock Osweiler
PlayerContract.create(player_id: Player.where(player_id:2533436).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Jamaal Charles
PlayerContract.create(player_id: Player.where(player_id:925).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:62)

#Austin Hooper 2555415
PlayerContract.create(player_id: Player.where(player_id:2555415).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Ameer Abdullah
PlayerContract.create(player_id: Player.where(player_id:2552374).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Sammy Watkins
PlayerContract.create(player_id: Player.where(player_id:2543457).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BILLY[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:33)


#TAPPLY
#Colin Kaepernick
PlayerContract.create(player_id: Player.where(player_id:2495186).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Lamar Miller
PlayerContract.create(player_id: Player.where(player_id:2533034).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:17)
#Josh Ferguson
PlayerContract.create(player_id: Player.where(player_id:2556411).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Emmanuel Sanders
PlayerContract.create(player_id: Player.where(player_id:497322).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:22)
#Allen Hurns
PlayerContract.create(player_id: Player.where(player_id:2550353).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)
#Desean Jackson
PlayerContract.create(player_id: Player.where(player_id:1581).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:28)
#Desean Jackson
PlayerContract.create(player_id: Player.where(player_id:1581).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:28)
#Austin Seferian-Jenkins
PlayerContract.create(player_id: Player.where(player_id:2543683).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:9)
#Chris Ivory
PlayerContract.create(player_id: Player.where(player_id:2507999).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Giants Defense
PlayerContract.create(player_id: Player.where(player_id:100023).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Giants Defense
PlayerContract.create(player_id: Player.where(player_id:2550636).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Golden Tate
PlayerContract.create(player_id: Player.where(player_id:497326).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:20)
#C.J. Prosise
PlayerContract.create(player_id: Player.where(player_id:2555417).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Charles Clay
PlayerContract.create(player_id: Player.where(player_id:2495139).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Matthew Stafford
PlayerContract.create(player_id: Player.where(player_id:2539266).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:8)
#Malcolm Mitchell
PlayerContract.create(player_id: Player.where(player_id:2555216).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Dorial Green-Beckham
PlayerContract.create(player_id: Player.where(player_id:2552491).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)
#C.J. Fiedorowicz
PlayerContract.create(player_id: Player.where(player_id:2543721).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:9)
#Nelson Agholor
PlayerContract.create(player_id: Player.where(player_id:2552600).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)
#Brian Quick
PlayerContract.create(player_id: Player.where(player_id:2532933).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Cardale Jones
PlayerContract.create(player_id: Player.where(player_id:2555426).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Devontae Booker
PlayerContract.create(player_id: Player.where(player_id:2555223).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Willie Snead
PlayerContract.create(player_id: Player.where(player_id:2550256).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)
#C.J. Anderson
PlayerContract.create(player_id: Player.where(player_id:2540269).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ADAM[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Alex MacDonald
#Blake Bortles
PlayerContract.create(player_id: Player.where(player_id:2543477).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)
#Alfred Blue
PlayerContract.create(player_id: Player.where(player_id:2543600).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)
#Kenjon Barner
PlayerContract.create(player_id: Player.where(player_id:2539289).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Martavis Bryant
PlayerContract.create(player_id: Player.where(player_id:2543572).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:32)
#Will Fuller
PlayerContract.create(player_id: Player.where(player_id:2555346).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)
#Quincy Enunwa
PlayerContract.create(player_id: Player.where(player_id:2543828).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:10)
#Zach Ertz
PlayerContract.create(player_id: Player.where(player_id:2540158).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:10)
#Terrance Williams
PlayerContract.create(player_id: Player.where(player_id:2539205).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Packers Defense
PlayerContract.create(player_id: Player.where(player_id:100011).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Chandler Catanzaro
PlayerContract.create(player_id: Player.where(player_id:2550325).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Chester Rogers
PlayerContract.create(player_id: Player.where(player_id:2556396).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Jared Goff
PlayerContract.create(player_id: Player.where(player_id:2555334).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Tyler Boyd
PlayerContract.create(player_id: Player.where(player_id:2555466).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:7)
#Jeff Heuerman
PlayerContract.create(player_id: Player.where(player_id:2552399).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Graham Gano
PlayerContract.create(player_id: Player.where(player_id:71309).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:2)
#Freddie Martino
PlayerContract.create(player_id: Player.where(player_id:2550223).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)
#Rex Burkhead
PlayerContract.create(player_id: Player.where(player_id:2539265).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)
#Ravens Defense
PlayerContract.create(player_id: Player.where(player_id:100002).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Paxton Lynch
PlayerContract.create(player_id: Player.where(player_id:2555316).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Tyler Higbee
PlayerContract.create(player_id: Player.where(player_id:2555364).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Trevor Siemian
PlayerContract.create(player_id: Player.where(player_id:2553457).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Quinton Patton
PlayerContract.create(player_id: Player.where(player_id:2539250).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Eddie Lacy
PlayerContract.create(player_id: Player.where(player_id:2540168).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:142)
#Markus Wheaton
PlayerContract.create(player_id: Player.where(player_id:2539291).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ALEX[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)

#Brad Hill
#Tom Brady
PlayerContract.create(player_id: Player.where(player_id:2504211).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:33)
#Todd Gurley
PlayerContract.create(player_id: Player.where(player_id:2552475).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:15)
#T.J. Yeldon
PlayerContract.create(player_id: Player.where(player_id:2552471).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:12)
#Julio Jones
PlayerContract.create(player_id: Player.where(player_id:2495454).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:85)
#Antonio Brown
PlayerContract.create(player_id: Player.where(player_id:2508061).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:61)
#Allen Robinson
PlayerContract.create(player_id: Player.where(player_id:2543509).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)
#Greg Olsen
PlayerContract.create(player_id: Player.where(player_id:2495700).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:8)
#Jeremy Maclin
PlayerContract.create(player_id: Player.where(player_id:80429).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:22)
#Seahawk Defense
PlayerContract.create(player_id: Player.where(player_id:80429).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Matt Bryant
PlayerContract.create(player_id: Player.where(player_id:2504797).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Kenneth Dixon
PlayerContract.create(player_id: Player.where(player_id:2555229).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)
#Marcus Mariota
PlayerContract.create(player_id: Player.where(player_id:2552466).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:2)
#Thomas Rawls
PlayerContract.create(player_id: Player.where(player_id:2553733).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)
#Devin Funchess
PlayerContract.create(player_id: Player.where(player_id:2552458).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Christine Michael
PlayerContract.create(player_id: Player.where(player_id:2539322).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)
#Marqise Lee
PlayerContract.create(player_id: Player.where(player_id:2543475).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Leonte Carroo
PlayerContract.create(player_id: Player.where(player_id:2555215).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#LeSean McCoy
PlayerContract.create(player_id: Player.where(player_id:79607).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:146)
#DeAndre Washington
PlayerContract.create(player_id: Player.where(player_id:2555464).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Tajae Sharpe
PlayerContract.create(player_id: Player.where(player_id:2555317).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Rob Kelley
PlayerContract.create(player_id: Player.where(player_id:2556414).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Teddy Bridgewater
PlayerContract.create(player_id: Player.where(player_id:2543465).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BARD[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Cam Newton
PlayerContract.create(player_id: Player.where(player_id:2495455).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:22)
#Matt Jones
PlayerContract.create(player_id: Player.where(player_id:2552635).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)
#Carlos Hyde
PlayerContract.create(player_id: Player.where(player_id:2543743).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:15)
#Julian Edelman
PlayerContract.create(player_id: Player.where(player_id:238498).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:34)
#Laquon Treadwell
PlayerContract.create(player_id: Player.where(player_id:2555214).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:13)
#Laquon Treadwell
PlayerContract.create(player_id: Player.where(player_id:2555214).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:13)
#Amari Cooper
PlayerContract.create(player_id: Player.where(player_id:2552487).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:13)
#Dwayne Allen
PlayerContract.create(player_id: Player.where(player_id:2533046).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)
#Jerrick McKinnon
PlayerContract.create(player_id: Player.where(player_id:2543715).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)
#Lions Defense
PlayerContract.create(player_id: Player.where(player_id:100010).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Josh Lambo
PlayerContract.create(player_id: Player.where(player_id:2553833).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Paul Perkins
PlayerContract.create(player_id: Player.where(player_id:2506264).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Dolphins Defense
PlayerContract.create(player_id: Player.where(player_id:100019).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Lance Kendricks
PlayerContract.create(player_id: Player.where(player_id:2495187).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Anquan Boldin
PlayerContract.create(player_id: Player.where(player_id:2505587).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)
#Chris Thompson
PlayerContract.create(player_id: Player.where(player_id:2540011).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)
#Jimmy Garoppolo
PlayerContract.create(player_id: Player.where(player_id:2505587).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)
#Dak Prescott
PlayerContract.create(player_id: Player.where(player_id:2555260).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Robby Anderson
PlayerContract.create(player_id: Player.where(player_id:2556462).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Robby Anderson
PlayerContract.create(player_id: Player.where(player_id:2495979).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:11)
#Jaelen Strong
PlayerContract.create(player_id: Player.where(player_id:2552463).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Jaelen Strong
PlayerContract.create(player_id: Player.where(player_id:2552463).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Bruce Ellington
PlayerContract.create(player_id: Player.where(player_id:2543646).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:BRENDAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)


#DAN
#Keenan Allen
PlayerContract.create(player_id: Player.where(player_id:2540154).first().player_id,
                     dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                     contract_type_id:ContractType.where(name:INITIAL).first().id,
                     first_year: TWENTY_FIFTEEN,
                     is_top_fourteen:FALSE,
                     current_salary:40)

#Danny Amendola
PlayerContract.create(player_id: Player.where(player_id:2649).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Sam Bradford
PlayerContract.create(player_id: Player.where(player_id:497095).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Pharoh Cooper
PlayerContract.create(player_id: Player.where(player_id:2555419).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Phillip Dorsett
PlayerContract.create(player_id: Player.where(player_id:2552424).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Joe Flacco
PlayerContract.create(player_id: Player.where(player_id:382).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:4)

#Stephen Gostkowski
PlayerContract.create(player_id: Player.where(player_id:2506922).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)

#Jesse James
PlayerContract.create(player_id: Player.where(player_id:2552633).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Jeremy Langford
PlayerContract.create(player_id: Player.where(player_id:2552379).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Jordan Matthews
PlayerContract.create(player_id: Player.where(player_id:2543500).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:7)

#Cameron Meredith
PlayerContract.create(player_id: Player.where(player_id:2553568).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)

#Chris Moore
PlayerContract.create(player_id: Player.where(player_id:2555209).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Alfred Morris
PlayerContract.create(player_id: Player.where(player_id:2533457).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Cordarrelle Patterson
PlayerContract.create(player_id: Player.where(player_id:2540145).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Jordan Reed
PlayerContract.create(player_id: Player.where(player_id:2540160).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:6)

#Seth Roberts
PlayerContract.create(player_id: Player.where(player_id:2550597).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Devin Smith
PlayerContract.create(player_id: Player.where(player_id:2553434).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Torrey Smith
PlayerContract.create(player_id: Player.where(player_id:2495459).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Mike Thomas
PlayerContract.create(player_id: Player.where(player_id:2556381).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Kevin White
PlayerContract.create(player_id: Player.where(player_id:2553432).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:10)

#Jonathan Williams
PlayerContract.create(player_id: Player.where(player_id:2555227).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#DEVANTE PARKER
PlayerContract.create(player_id: Player.where(player_id:2552409).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)
#JOSH GORDON
PlayerContract.create(player_id: Player.where(player_id:2537931).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DAN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:25)
#DARIUS JACKSON Rookie nothing

#GOAT

#Kamar Aiken
PlayerContract.create(player_id: Player.where(player_id:2530660).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Cameron Artis-Payne
PlayerContract.create(player_id: Player.where(player_id:2552375).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Buffalo Bills
PlayerContract.create(player_id: Player.where(player_id:100003).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Mike Evans
PlayerContract.create(player_id: Player.where(player_id:2543468).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:20)

#A.J. Green
PlayerContract.create(player_id: Player.where(player_id:2495450).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:95)

#Ladarius Green
PlayerContract.create(player_id: Player.where(player_id:2532853).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Jordan Howard
PlayerContract.create(player_id: Player.where(player_id:2555418).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:1)

#Mark Ingram
PlayerContract.create(player_id: Player.where(player_id:2495466).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:12)

#Donte Moncrief
PlayerContract.create(player_id: Player.where(player_id:2543614).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Carson Palmer
PlayerContract.create(player_id: Player.where(player_id:2505245).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:4)

#Theo Riddick
PlayerContract.create(player_id: Player.where(player_id:2540020).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Eddie Royal
PlayerContract.create(player_id: Player.where(player_id:1990).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Kyle Rudolph
PlayerContract.create(player_id: Player.where(player_id:2495438).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:7)

#Sterling Shepard
PlayerContract.create(player_id: Player.where(player_id:2555295).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:10)

#Jonathan Stewart
PlayerContract.create(player_id: Player.where(player_id:949).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:7)

#Tyrod Taylor
PlayerContract.create(player_id: Player.where(player_id:2495240).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Carson Wentz
PlayerContract.create(player_id: Player.where(player_id:2555259).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)
#Karlos Williams
PlayerContract.create(player_id: Player.where(player_id:2552380).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:GOAT[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#DEREK
#Martellus Bennett
PlayerContract.create(player_id: Player.where(player_id:1062).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:6)

#Kapri Bibbs
PlayerContract.create(player_id: Player.where(player_id:2550542).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:10)

#Drew Brees
PlayerContract.create(player_id: Player.where(player_id:2504775).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:39)

#Tevin Coleman
PlayerContract.create(player_id: Player.where(player_id:2552453).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:9)

#Matt Forte
PlayerContract.create(player_id: Player.where(player_id:234).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:99)

#Devonta Freeman
PlayerContract.create(player_id: Player.where(player_id:2543583).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:12)

#Ted Ginn
PlayerContract.create(player_id: Player.where(player_id:2507166).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:7)

#Jimmy Graham
PlayerContract.create(player_id: Player.where(player_id:497236).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:40)

#Tim Hightower
PlayerContract.create(player_id: Player.where(player_id:4383).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#T.Y. Hilton
PlayerContract.create(player_id: Player.where(player_id:2532865).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:26)

#Vincent Jackson
PlayerContract.create(player_id: Player.where(player_id:2506400).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:29)

#Rashad Jennings
PlayerContract.create(player_id: Player.where(player_id:71345).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:43)

#Brandon LaFell
PlayerContract.create(player_id: Player.where(player_id:497302).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Charone Peake
PlayerContract.create(player_id: Player.where(player_id:2555477).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#James Starks
PlayerContract.create(player_id: Player.where(player_id:497206).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Ryan Tannehill
PlayerContract.create(player_id: Player.where(player_id:2532956).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Adam Vinatieri
PlayerContract.create(player_id: Player.where(player_id:2503471).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Mike Wallace
PlayerContract.create(player_id: Player.where(player_id:2507763).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:10)

#Tyrell Williams
PlayerContract.create(player_id: Player.where(player_id:2553913).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Jason Witten
PlayerContract.create(player_id: Player.where(player_id:2505629).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:18)

#Rueben Randle
PlayerContract.create(player_id: Player.where(player_id:2533533).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)
#CARDINALS D
PlayerContract.create(player_id: Player.where(player_id:100026).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:4)
#CHARGERS D
PlayerContract.create(player_id: Player.where(player_id:100028).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:DEREK[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)


#FISCHETTI
#Davante Adams
PlayerContract.create(player_id: Player.where(player_id:2543495).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Dez Bryant
PlayerContract.create(player_id: Player.where(player_id:497278).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:91)

#Stefon Diggs
PlayerContract.create(player_id: Player.where(player_id:2552608).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Tyler Ervin
PlayerContract.create(player_id: Player.where(player_id:2555234).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Kenneth Farrow
PlayerContract.create(player_id: Player.where(player_id:2556801).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Coby Fleener
PlayerContract.create(player_id: Player.where(player_id:2532838).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Mike Gillislee
PlayerContract.create(player_id: Player.where(player_id:2539663).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Frank Gore
PlayerContract.create(player_id: Player.where(player_id:2506404).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:25)

#David Johnson
PlayerContract.create(player_id: Player.where(player_id:2553435).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:2)

#Jarvis Landry
PlayerContract.create(player_id: Player.where(player_id:2543488).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Tyler Lockett
PlayerContract.create(player_id: Player.where(player_id:2552430).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Rishard Matthews
PlayerContract.create(player_id: Player.where(player_id:2532903).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Ty Montgomery
PlayerContract.create(player_id: Player.where(player_id:2552429).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#DeMarco Murray
PlayerContract.create(player_id: Player.where(player_id:2495207).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:73)

#Aaron Rodgers
PlayerContract.create(player_id: Player.where(player_id:2506363).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:97)

#Justin Tucker
PlayerContract.create(player_id: Player.where(player_id:2536340).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Minnesota Vikings
PlayerContract.create(player_id: Player.where(player_id:100020).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:1)

#Maxx Williams
PlayerContract.create(player_id: Player.where(player_id:2552468).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Russell Wilson
PlayerContract.create(player_id: Player.where(player_id:2532975).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:20)

#Danny Woodhead
PlayerContract.create(player_id: Player.where(player_id:4327).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:8)

#Robert Woods
PlayerContract.create(player_id: Player.where(player_id:2540169).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Zach Zenner
PlayerContract.create(player_id: Player.where(player_id:2553631).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:FISCHETTI[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#JONO
#John Brown
PlayerContract.create(player_id: Player.where(player_id:2543847).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:30)

#Sammie Coates
PlayerContract.create(player_id: Player.where(player_id:2552470).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Randall Cobb
PlayerContract.create(player_id: Player.where(player_id:2495448).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:64)

#Chris Conley
PlayerContract.create(player_id: Player.where(player_id:2552652).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Tyler Eifert
PlayerContract.create(player_id: Player.where(player_id:2540148).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Eli Manning
PlayerContract.create(player_id: Player.where(player_id:2505996).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:17)

#Latavius Murray
PlayerContract.create(player_id: Player.where(player_id:2541161).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#J.J. Nelson
PlayerContract.create(player_id: Player.where(player_id:2552656).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Breshad Perriman
PlayerContract.create(player_id: Player.where(player_id:2552597).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:7)

#Jalen Richard
PlayerContract.create(player_id: Player.where(player_id:2556885).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Wendell Smallwood
PlayerContract.create(player_id: Player.where(player_id:2555461).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Clive Walford
PlayerContract.create(player_id: Player.where(player_id:2552397).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Kendall Wright
PlayerContract.create(player_id: Player.where(player_id:2532977).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JONO[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#JUSTIN
#Jay Ajayi
PlayerContract.create(player_id: Player.where(player_id:2552582).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:2)

#Giovani Bernard
PlayerContract.create(player_id: Player.where(player_id:2540156).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:34)

#Kansas City Chiefs
PlayerContract.create(player_id: Player.where(player_id:100016).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:2)

#Kirk Cousins
PlayerContract.create(player_id: Player.where(player_id:2532820).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:16)

#Jack Doyle
PlayerContract.create(player_id: Player.where(player_id:2540232).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)

#Kenyan Drake
PlayerContract.create(player_id: Player.where(player_id:2555230).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Larry Fitzgerald
PlayerContract.create(player_id: Player.where(player_id:2506106).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:29)

#Jeremy Hill
PlayerContract.create(player_id: Player.where(player_id:2543603).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:6)

#Tyreek Hill
PlayerContract.create(player_id: Player.where(player_id:2556214).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:9)

#Dontrelle Inman
PlayerContract.create(player_id: Player.where(player_id:2530700).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Travis Kelce
PlayerContract.create(player_id: Player.where(player_id:2540258).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:6)

#Jeremy Kerley
PlayerContract.create(player_id: Player.where(player_id:2495189).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Andrew Luck
PlayerContract.create(player_id: Player.where(player_id:2533031).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:64)
#Tom Savage
PlayerContract.create(player_id: Player.where(player_id:2543640).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Demaryius Thomas
PlayerContract.create(player_id: Player.where(player_id:497328).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:98)

#Shane Vereen
PlayerContract.create(player_id: Player.where(player_id:2495473).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:31)

#Spencer Ware
PlayerContract.create(player_id: Player.where(player_id:2540204).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:25)

#Charcandrick West
PlayerContract.create(player_id: Player.where(player_id:2550268).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:8)

#Damien Williams
PlayerContract.create(player_id: Player.where(player_id:2550512).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)
#Michael Thomas
PlayerContract.create(player_id: Player.where(player_id:2535687).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:9)
#Odell Beckham
PlayerContract.create(player_id: Player.where(player_id:2543496).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:JUSTIN[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)



#NATE
#Tavon Austin
PlayerContract.create(player_id: Player.where(player_id:2539336).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Cole Beasley
PlayerContract.create(player_id: Player.where(player_id:2535698).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Kelvin Benjamin
PlayerContract.create(player_id: Player.where(player_id:2543471).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:20)

#Alex Collins
PlayerContract.create(player_id: Player.where(player_id:2555430).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Jared Cook
PlayerContract.create(player_id: Player.where(player_id:71265).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Jamison Crowder
PlayerContract.create(player_id: Player.where(player_id:2552415).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Josh Doctson
PlayerContract.create(player_id: Player.where(player_id:2555343).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)

#Hunter Henry
PlayerContract.create(player_id: Player.where(player_id:2555341).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Rashard Higgins
PlayerContract.create(player_id: Player.where(player_id:2555468).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Chris Hogan
PlayerContract.create(player_id: Player.where(player_id:2530515).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:11)

#Ryan Mathews
PlayerContract.create(player_id: Player.where(player_id:497188).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:26)

#Eli Rogers
PlayerContract.create(player_id: Player.where(player_id:2553737).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Jameis Winston
PlayerContract.create(player_id: Player.where(player_id:2552033).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)
#Ka'Deem Carey
PlayerContract.create(player_id: Player.where(player_id:2543551).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:NATE[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#KEITH MARSHALL ROOK

#PEALER
#Doug Baldwin
PlayerContract.create(player_id: Player.where(player_id:2530747).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:12)

#Gary Barnidge
PlayerContract.create(player_id: Player.where(player_id:1060).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:6)

#Travis Benjamin
PlayerContract.create(player_id: Player.where(player_id:2532790).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Kenny Britt
PlayerContract.create(player_id: Player.where(player_id:71217).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Corey Coleman
PlayerContract.create(player_id: Player.where(player_id:2555333).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:12)

#Isaiah Crowell
PlayerContract.create(player_id: Player.where(player_id:2550189).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Ezekiel Elliott
PlayerContract.create(player_id: Player.where(player_id:2555224).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:14)

#Taylor Gabriel
PlayerContract.create(player_id: Player.where(player_id:2550617).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Antonio Gates
PlayerContract.create(player_id: Player.where(player_id:2505299).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:4)

#Melvin Gordon
PlayerContract.create(player_id: Player.where(player_id:2552469).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:14)

#Steven Hauschka
PlayerContract.create(player_id: Player.where(player_id:2507374).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#DeAndre Hopkins
PlayerContract.create(player_id: Player.where(player_id:2540165).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:20)

#Brian Hoyer
PlayerContract.create(player_id: Player.where(player_id:81294).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Duke Johnson
PlayerContract.create(player_id: Player.where(player_id:2552461).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Cody Kessler
PlayerContract.create(player_id: Player.where(player_id:2555387).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:1)

#Carolina Panthers
PlayerContract.create(player_id: Player.where(player_id:100004).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:2)

#Terrelle Pryor
PlayerContract.create(player_id: Player.where(player_id:2531332).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Philip Rivers
PlayerContract.create(player_id: Player.where(player_id:2506121).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)

#Matt Ryan
PlayerContract.create(player_id: Player.where(player_id:310).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:13)

#Kenny Stills
PlayerContract.create(player_id: Player.where(player_id:2540202).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Delanie Walker
PlayerContract.create(player_id: Player.where(player_id:2495966).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:3)

#Terrance West
PlayerContract.create(player_id: Player.where(player_id:2543664).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:12)

#James White
PlayerContract.create(player_id: Player.where(player_id:2543773).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:PEALER[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)





#ROB
#Matt Asiata
PlayerContract.create(player_id: Player.where(player_id:2495258).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:26)

#LeGarrette Blount
PlayerContract.create(player_id: Player.where(player_id:497149).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:7)

#Michael Crabtree
PlayerContract.create(player_id: Player.where(player_id:71269).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:18)

#Eric Ebron
PlayerContract.create(player_id: Player.where(player_id:2543466).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:7)

#Michael Floyd
PlayerContract.create(player_id: Player.where(player_id:2532841).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:31)

#Justin Forsett
PlayerContract.create(player_id: Player.where(player_id:927).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Jermaine Gresham
PlayerContract.create(player_id: Player.where(player_id:497238).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Marvin Jones
PlayerContract.create(player_id: Player.where(player_id:2532884).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:4)

#Jermaine Kearse
PlayerContract.create(player_id: Player.where(player_id:2532887).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:6)

#Brandon Marshall
PlayerContract.create(player_id: Player.where(player_id:2532898).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:40)
#Doug Martin
PlayerContract.create(player_id: Player.where(player_id:2532899).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:55)

#Zach Miller
PlayerContract.create(player_id: Player.where(player_id:238457).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)

#Jordy Nelson
PlayerContract.create(player_id: Player.where(player_id:1032).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:62)

#Matt Prater
PlayerContract.create(player_id: Player.where(player_id:2506677).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:1)

#Jacquizz Rodgers
PlayerContract.create(player_id: Player.where(player_id:2495471).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:30)

#Ben Roethlisberger
PlayerContract.create(player_id: Player.where(player_id:2506109).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:4)

#Mohamed Sanu
PlayerContract.create(player_id: Player.where(player_id:2533040).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:2)

#Charles Sims
PlayerContract.create(player_id: Player.where(player_id:2543770).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:3)

#Adam Thielen
PlayerContract.create(player_id: Player.where(player_id:2541785).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:FIRST).first().id,
                      first_year: TWENTY_SIXTEEN,
                      is_top_fourteen:FALSE,
                      current_salary:5)

#Zach Miller
PlayerContract.create(player_id: Player.where(player_id:2507170).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FIFTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:5)
#Le'Veon Bell
PlayerContract.create(player_id: Player.where(player_id:2540175).first().player_id,
                      dynasty_team_id:DynastyTeam.where(team_name:ROB[:team_name]).first().id,
                      contract_type_id:ContractType.where(name:INITIAL).first().id,
                      first_year: TWENTY_FOURTEEN,
                      is_top_fourteen:TRUE,
                      current_salary:63)








