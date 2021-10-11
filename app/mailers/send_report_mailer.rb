class SendReportMailer < ApplicationMailer
  default from: "no-reply@axalifeins.com"

  def send_report(invoice_id)
  	@invoice = Invoice.find invoice_id
    file_path = Rails.root.join('public', "premium_invoice_#{@invoice.id}.pdf")
    attachments["premium_invoice_#{invoice_id}.pdf"] = File.read(file_path)
  	mail(to: @invoice.to_email, subject: 'Insurance Payment Online Receipt')
    File.delete(file_path) if File.exist?(file_path)
  end
end
