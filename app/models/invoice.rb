class Invoice < ApplicationRecord
  STATUS_CLASS = {
    :draft => "badge badge-secondary",
    :sent => "badge badge-primary",
    :paid => "badge badge-success"
  }

  def subtotal
    1000
  end

  def discount_calculated
    subtotal * (self.discount / 100.0)
  end

  def vat_calculated
    (subtotal - discount_calculated) * (self.vat / 100.0)
  end

  def total
    subtotal - discount_calculated + vat_calculated
  end

  def status_class
    STATUS_CLASS[self.status.to_sym]
  end
end
