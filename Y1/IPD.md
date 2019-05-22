# Iterated Prisoner's Dilenma

## Payoffs
- How many points gained based game result
#### Temtpation (5 Points)
- When agent defects and opponent cooperates, 5 points gained
#### Reward (3 Points)
- When agent and opponent both cooperate, 3 points gained
#### Punishment (1 Point)
- When agent and opponent both defect, 1 point gained
#### Sucker (0 Points)
- When agent cooperates and opponent defects, 0 points gained

## Agents
- 20 agents per game
- Generate the agents using Mersenne's Twister (Matlab's default RNG, use rng(seed) to seed it and randi to create matrix)
- Each agent has 3 elements, (initial, defect, cooperate)
  1. Initial is what the agent originally does
  2. Defect is what the agent does when the opponent defects
  3. Cooperate is what the agent does when the opponent cooperates

## Game-Playing
- 