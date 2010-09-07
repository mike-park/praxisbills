module InvoicesHelper
  def invoice_status(invoice)
    invoice.open ? "Open" : "Closed"
  end
end
