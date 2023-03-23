# User Stories
Demonstrating the intended functionality of this example app at a high-level. The app is a houseplant manager/tracker that allows a user to CRUD their plants, mark waterings, fertilizing, and other common houseplant activities, similar to [Planta](https://getplanta.com).

## Conditions and Assumptions
* There is no concept of user accounts or login/authentication
	* The project is intended to manage houseplants for any user that interacts with the system
	* Thus, there is no permissioning/ACL
* This app serves as an example implementation and is not a stand-alone iteration upon or competitor to RSwag

## App logic
### Plant Lifecycle (CRUD)
#### Creation
> As a user, I want to be able to create a new plant, so that I can track it.

This is the "entry point". Obviously, we need to be able to add plants to get any utility out of our app.

#### Retrieval
> As a user, I want to be able to retrieve my plant(s), so that I can track them.

We also need to see our list of plants to make sense of what we have. This will eventually spur us to decide if they need attention or not.
A user should be able to retrieve one plant at a time or all of their plants.

#### Updates
> As a user, I want to be able to update my existing plants, so that I can correct any mistakes or update facts about it.

As time passes, plants change just as we do. Perhaps they need to be updated to reflect this reality.

#### Removal
> As a user, I want to be able to remove a plant, so that I can stop tracking it.

Perhaps we gave a plant a way. Or sadly it died. These are just a couple of reasons we may want to remove a plant from our list of tracked plants.

### Plant Care
#### Watering
> As a user, I want to be able to track my plants' watering, so that I can be sure to not under- or overwater my plants.

Perhaps the most compelling use case of something like this would be to track a plant's watering schedule. Most people don't water their plants enough or correctly, so this is why they end up dying.

##### Creation
> As a user, I want to be able to mark a plant watering on a day and time, so that I can log when I gave my plants water.

This should create a new 'watering' event and associate it with the plant.

##### Retrieval
> As a user, I want to be able to view plant waterings, so that I can review when I gave my plant water.

This will give us a historical log of when our plants were watered. This can be done for one plant or many plants at a time.

##### Updating
> As a user, I want to be able to update a plant watering, so that I can correct a mistake or make a modification.

This is just in case a watering was done a different day.

##### Removal
> As a user, I want to be able to delete a plant watering, so that I can correct a mistake.

Maybe it didn't actually get watered!

#### Fertilizer
> As a user, I want to be able to track my plants' fertilization, so that I can be sure they're receiving the necessary nutrients.

House plants also need fertilization so they can thrive.

##### Creation
> As a user, I want to be able to mark a plant fertilization on a day and time, so that I can log when I gave my plant water.

This should create a new 'fertilizing' event and associate it with the plant.

##### Retrieval
> As a user, I want to be able to view plant fertilizations, so that I can review when I gave my plants fertilizer.

This will give us a historical log of when our plants were watered. This can be done for one plant or many plants at a time.

##### Updating
> As a user, I want to be able to update a plant fertilization, so that I can correct a mistake or make a modification.

This is just in case a fertilization was done a different day.

##### Removal
> As a user, I want to be able to delete a plant fertilization, so that I can correct a mistake.

Maybe it didn't actually get fertilization!
