# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if Rails.env.local?
  [
    { name: "Ana Beatriz Souza", email_address: "ana.souza@example.com", phone: "16999990001" },
    { name: "Carlos Eduardo Lima", email_address: "carlos.lima@example.com", phone: "16999990002" },
    { name: "Fernanda Oliveira Santos", email_address: "fernanda.santos@example.com", phone: "16999990003" },
    { name: "Rafael Costa Almeida", email_address: "rafael.almeida@example.com", phone: "16999990004", active: false },
    { name: "Juliana Pereira Rocha", email_address: "juliana.rocha@example.com", phone: "16999990005" },
    { name: "Bruno Henrique Fernandes", email_address: "bruno.fernandes@example.com", phone: "16999990006", active: false }
  ].each do |attrs|
    User.find_or_create_by!(email_address: attrs[:email_address]) do |user|
      user.name = attrs[:name]
      user.phone = attrs[:phone]
      user.password = "password123"
      user.role = :member
      user.active = attrs.fetch(:active, true)
    end
  end

  puts "Seed concluído: #{User.count} usuário(s) no banco."
end
