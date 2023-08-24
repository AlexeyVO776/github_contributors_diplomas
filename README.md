<<<<<<< HEAD
# GitHub_Contributors_Certificate_Generator
This application generates certificates for the top 3 contributors of any GitHub repository.
Features

Generate individual PDF certificates for each contributor.
Option to download all certificates in a ZIP file.
Integration with the GitHub API to retrieve the list of contributors.

**Installation and Setup**

1. Clone the repository:

        git clone [link to your repository]

2. Install all dependencies:

        bundle install

3. Set up and configure the database:

        rails db:create
        rails db:migrate

4. Add your GitHub API token to config/application.yml or use environment variables:

        development:
          github_token: YOUR_GITHUB_TOKEN

5. Start the server:

        rails server

Now, you can open the application in your browser at **http://localhost:3000**.


**Usage**

1. Enter the repository URL into the "Repository URL" field.
2. Click on "Fetch Contributors".
3. Download individual contributor certificates or the ZIP archive containing all of them.
=======
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
>>>>>>> 56e9c3a (Initial commit)
