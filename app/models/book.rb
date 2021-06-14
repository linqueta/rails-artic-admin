class Book < ApplicationRecord
  def self.check_google
    agent = Mechanize.new
    link = 'https://mg.olx.com.br/belo-horizonte-e-regiao/regiao-de-ipatinga/ipatinga/imoveis/aluguel/apartamentos'
    page = agent.get(link)

    page.search('ul#ad-list').search('a')


    login_form = page.form
    login_form.field_with(name: 'user[email]').value = 'admin@example.com'
    login_form.field_with(name: 'user[password]').value = 'password'
    product_list_page = agent.submit(login_form)
  end
end
