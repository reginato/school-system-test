# encoding: utf-8

Dado /^que eu estou no root$/ do
  visit root_path
end

Então /^eu clico no link (.*)$/ do |link_name|
  click_link(link_name)
end

Então /^eu crio um novo aluno preenchendo todos os campos dos cadastro$/ do
  fill_in("student_name",    with: "Rodrigo Reginato Marques")
  select("5 serie A", :from => "student_group_id")  
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

Então /^eu crio uma nova classe preenchendo todos os campos dos cadastro$/ do
  fill_in("group_name",    with: "5 Serie A")
  check("Portugues")
  click_button("Create Group")  
end    

Então /^entao devo visualizar apos o cadatro$/ do
  page.should have_content('Group was successfully created.')
end