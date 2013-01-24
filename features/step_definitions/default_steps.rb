# encoding: utf-8

Dado /^que eu estou no root$/ do
  visit root_path
end

Então /^eu clico no link (.*)$/ do |link_name|
  click_link(link_name)
end

Então /^eu crio um novo aluno preenchendo todos os campos dos cadastro$/ do
  fill_in("student_name",    with: "Rodrigo Reginato Marques")
  click_button("Create Student")
end

Então /^entao devo visualizar$/ do
  page.should have_content('Student was successfully created.')
end