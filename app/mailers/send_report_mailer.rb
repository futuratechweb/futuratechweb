class SendReportMailer < ApplicationMailer
  default from: "no-reply@axalifeins.com"

  def send_report(invoice_id)
  	@invoice = Invoice.find invoice_id
    file_path = Rails.root.join('pdfs', "premium_invoice_#{@invoice.id}.pdf")
    puts "#{file_path}===================mailer"
    attachments["premium_invoice_#{invoice_id}.pdf"] = File.read(file_path)
  	mail(to: @invoice.to_email, subject: 'Insurance Payment Online Receipt')
    File.delete(file_path) if File.exist?(file_path)
  end
end
