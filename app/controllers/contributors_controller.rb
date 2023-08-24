class ContributorsController < ApplicationController
  require 'octokit'

  def index
    @contributors = Contributor.all
  end

  def fetch
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    repo_url = params[:repo_url]
  
    repo_owner, repo_name = parse_repo_url(repo_url)
  
    contributors = client.contributors("#{repo_owner}/#{repo_name}", per_page: 10, sort: 'contributions', order: 'desc')
  
    top_contributors = contributors.take(3) 
  
    saved_contributors = []
  
    top_contributors.each do |contributor|
      contributor_record = Contributor.new(login: contributor.login, contributions: contributor.contributions)
      if contributor_record.save
        saved_contributors << contributor_record
        logger.info "Контрибьютор #{contributor.login} с ID #{contributor_record.id} успешно сохранён в базе данных."
      else
        logger.error "Ошибка при сохранении контрибьютора: #{contributor_record.errors.full_messages.join(', ')}"
      end
    end
    
    @top_contributors = saved_contributors
    render 'show_contributors' 
  end  

  def download_certificate
    @contributor = Contributor.find(params[:id])

    pdf_content = PdfGenerator.generate_single_pdf(@contributor)
    send_data pdf_content, filename: "certificate.pdf", type: "application/pdf", disposition: "inline"
  end
 
  def download_zip
    top_contributors = Contributor.last(3)
    # zip_content = PdfGenerator.generate_zip(@contributors)
    zip_content = PdfGenerator.generate_zip(top_contributors)
    send_data zip_content, filename: "certificates.zip", type: "application/zip", disposition: "attachment"
  end
  
  private

  def parse_repo_url(url)
    uri = URI.parse(url)
    path_parts = uri.path.split('/')

    repo_owner = path_parts[1]
    repo_name = path_parts[2]

    [repo_owner, repo_name]
  end
end
