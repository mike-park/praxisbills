# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :patients_nav, 'Patients', patients_path, :highlights_on => /^\/patients/
    primary.item :invoices_nav, 'Invoices', invoices_path, :highlights_on => /^\/invoices/
    primary.item :payments_nav, 'Payments', payments_path, :highlights_on => /^\/payments/
    primary.item :insurers_nav, 'Insurers', insurers_path, :highlights_on => /^\/insurers/
    primary.item :pricelists_nav, 'Pricelists', pricelists_path, :highlights_on => /^\/pricelists/
    primary.item :therapies_nav, 'Therapies', therapies_path, :highlights_on => /^\/therapies/
  end
end
