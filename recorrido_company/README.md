# Recorrido Support Company

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)

## Introduction

The Recorrido Supporter Company is a web application built on Rails 7 that manages guard assignments for clients. It includes functionalities for managing clients, supporter employees, client schedules, assignments, and more.

## Features

- Manage employees assigned to support clients.
- Create and manage schedules for client assignments.

## Technologies Used

- Ruby on Rails
- Tailwind CSS
- Import-map-rails
- Stimulus.js
- PostgreSQL

## Setup Instructions

### Prerequisites

- Ruby 3.2.2
- Rails 7.1.3
- PostgreSQL

### Installation and Configuration

1. Clone the repository.
2. Install dependencies with `bundle install`.
3. Configure your database settings copying the .env.example file and creating the .env file with the correct values.
4. Set up the database with `rails db:setup`.
6. Re build tailwind with `rails tailwindcss:build`
5. Start the server with `rails server`.

## Usage

1. Navigate to `http://localhost:3000/client_schedules`.
2. Check the filter by clients and weeks


