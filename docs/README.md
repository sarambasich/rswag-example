# RSwag Example, Overview
This is an example app demonstrating the [RSwag library](https://github.com/rswag/rswag)'s use in a project. The intention is to demonstrate keeping API documentation in sync with the code's logic. The app's stack is a Dockerized Rails app with a Postgres database and vanilla JavaScript frontend. The app is a houseplant manager/tracker that allows a user to CRUD their plants, mark waterings, fertilizing, and other common houseplant activities, similar to [Planta](https://getplanta.com). It is intended to be minimal yet sufficiently complex enough to demonstrate that RSwag solves the problem of API documentation drift at a "real world" level.

## Background - what is this project for?
Throughout my career as a software engineer working mostly on SaaS apps with client-server interactions via ReSTful-ish APIs, _every single team_ I've worked on has had the problem of diverging documentation, if there's documentation at all, with their backends' API endpoints. This leads to poor discovery of available services, high barriers to entry, and creates silos of tribal knowledge. These are all problematic because they create an environment ripe for mismatched expectations and thus a breeding ground for bugs. It also generally slows down the team as engineers have to spend more time deep diving and navigating often megalithic codebases to figure out what is going on. Even in widely used web frameworks like Rails or Django with established routing/request paradigms, this still requires effort because custom logic and middleware will often accrue over time making those paradigms less obvious or straightforward. In contrast, with accurate and up-to-date API documentation, engineers can more quickly understand the services available and implement solutions that consume those interfaces more readily.

I'd love to never again deal with being tossed into an app with an API that has inaccurate or no documentation. This project is intended to be an example that addresses these aforementioned problems. It also aims to improve upon the pitfalls currently . Finally, it aims to be a simple yet fleshed out enough real world of example of how this could work in engineering teams anywhere. Certainly, this isn't the be-all, end-all, and I think it would do us good to look at other concepts such as [hypermedia APIs](https://smartbear.com/learn/api-design/what-is-hypermedia/). However, keeping documentation up to date is a perennial challenge for engineering teams, and if we can implement a better solution for this, I think we'll be a lot better off. It'll be an additional way to help avoid the [bikeshedding](https://bikeshed.com) that comes with API docs.

## Conditions and Challenges
* This is implemented by example and is not intended to be perfect or authoritative or act as a stand-alone library for use in other projects
* [This thoughtful article from Teal](https://www.tealhq.com/post/how-teal-keeps-their-api-tests-and-documentation-in-sync) indicates there are some pitfalls with RSwag but is dated from 2020 (I am writing this text in March 2023)
	* If these are still issues, I'd love to address them as part of this project
	* More generally, I'd love to try to address other glaring, outstanding issues that undercut the goal of RSwag
* This is intended for Rails + RSpec, but it'd be nice to have this concept apply to other web and testing frameworks
	* [`python-doctest`](https://realpython.com/python-doctest/) is similar but seems to be intended more for general use rather than API documentation
* The project is intended to be mostly API-focused but will include a minimal web frontend for ease of use

## Project goals
* ✅ Implement an example project that uses RSwag to auto-generate accurate API documentation that does not diverge from the source code
* ✅ The project is sufficiently complex to demonstrate real world use while still being approachable and easy to grok
* ✅ Make improvements to RSwag where it potentially falls short
