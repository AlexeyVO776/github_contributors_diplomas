require 'prawn'
require 'zip'

class PdfGenerator
  def self.generate_single_pdf(contributor)
    pdf_content = Prawn::Document.new do
      font_families.update(
        "CustomFont" => { normal: Rails.root.join('app', 'assets', 'fonts', 'Arial.ttf') }
      )
      font "CustomFont"
  
      font_size 24
      text "Сертификат о вкладе в развитие проекта.", align: :center
      move_down 20
      font_size 18
  
      text "Сертификат свидетельствует о том, что #{contributor.login.upcase} внес существенный вклад в развитие проекта.", align: :center
      move_down 30
  
      text "Подал #{contributor.contributions} запрос на внесение изменений.", align: :center
      move_down 50
  
      formatted_date = Time.now.strftime("%e %B %Y года")
      text "Дата выдачи сертификата: #{formatted_date}", align: :right
    end.render
    return pdf_content
  end

  def self.generate_zip(contributors)
    zip_stream = Zip::OutputStream.write_buffer do |zip|
      contributors.each do |contributor|
        pdf_content = generate_single_pdf(contributor)
        zip.put_next_entry "#{contributor.login}_diploma.pdf"
        zip.write pdf_content
      end
    end
    zip_stream.rewind
    return zip_stream.string
  end
  
end
