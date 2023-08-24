# GitHub_Contributors_Certificate_Generator

This application generates certificates for the top 3 contributors of any GitHub repository.
Features

Generate individual PDF certificates for each contributor.
Option to download all certificates in a ZIP file.
Integration with the GitHub API to retrieve the list of contributors.

**Installation and Setup**

1.  Clone the repository:

        git clone [link to your repository]

2.  Install all dependencies:

        bundle install

3.  Set up and configure the database:

        rails db:create
        rails db:migrate

4.  Add your GitHub API token to config/application.yml or use environment variables:

        development:
          github_token: YOUR_GITHUB_TOKEN

5.  Start the server:

        rails server

Now, you can open the application in your browser at **http://localhost:3000**.
