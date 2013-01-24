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

Então /^eu edito o nome da disciplina$/ do
  fill_in("discipline_name",    with: "História")
  click_button("Update Discipline")
end

Então /^entao devo visualizar$/ do
  page.should have_content('Student was successfully created.')
end

Então /^eu crio um nova disciplina preenchendo todos os campos dos cadastro$/ do
  fill_in("discipline_name",    with: "Geografia")
  select("Professor Pardal", :from => "discipline_teacher_id")
  click_button("Create Discipline")
end