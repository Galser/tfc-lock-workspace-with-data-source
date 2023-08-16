# tfc-lock-workspace-with-data-source

Code taht can make TFC workspace stuck or running for a long time, or fai lwith timeout after long time,  using custom data source requesting to external HTTP resource

# Requirements
- Terraform knowledge
- TFC access


# How to use

- Clone this code into your repo
- Connect NEW worksoace to cloned repo
- Setup variables for on of TWO scenarious, read below in details
  - `api_timeout` - the delay that you want to introduce , in seconds
  - `safety_gap` - small amount of milliseconds that you add on top of timeout - to be propogated into `request_timeout_ms` for data "http" 

## Scenario 1  : SUCCESS

- Define vars in a way where `safety_gap` if large for example 60-120 and `api_timeout` low 300-600
- Run apply, it shoudl be succesfull

##  Scenario 2  : LONG run and FAIL
- Opposite to previous case - define vars in a way where `api_timeout` is large for example 60000-120000 and `safety_gap` low or negative , so it will fail
- Run appluy, observe it fail after long pause
