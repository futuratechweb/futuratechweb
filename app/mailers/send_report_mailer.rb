class SendReportMailer < ApplicationMailer
  default from: "smnmalai@gmail.com"

  def send_report(invoice_id)
  	@invoice = Invoice.find invoice_id
  	attachments["premium_invoice_#{invoice_id}.pdf"] = File.read(Rails.root.join('pdfs', "premium_invoice_#{@invoice.id}.pdf"))
  	mail(to: @invoice.to_email, subject: 'Insurance Payment Online Receipt')  	
  end
end
