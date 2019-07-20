require 'test_helper'

class ConvertersBeforeValidation::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, ConvertersBeforeValidation
  end

  test 'function squish_before_validation_for should exist in User.methods' do
    assert :squish_before_validation_for.in?(User.methods)
  end

  test 'function string_converter_before_validation should exist in User.methods' do
    assert :string_converter_before_validation.in?(User.methods)
  end

  test 'function downcase_before_validation_for should exist in User.methods' do
    assert :downcase_before_validation_for.in?(User.methods)
  end

  test 'function upcase_before_validation_for should exist in User.methods' do
    assert :upcase_before_validation_for.in?(User.methods)
  end

  test 'name should be squished by squish_before_validation_for' do
    user = User.new(input_params)
    name = user.name.squish
    assert_not_equal name, user.name
    user.save
    assert_equal name, user.name
  end

  test 'email should be squished and downcased by squish_before_validation_for and downcase_before_validation_for' do
    user = User.new(input_params)
    email = user.email.squish.downcase
    assert_not_equal email, user.email
    user.save
    assert_equal email, user.email
  end

  test 'title should be upcased by upcase_before_validation_for' do
    user = User.new(input_params)
    title = user.title.upcase
    assert_not_equal title, user.title
    user.save
    assert_equal title, user.title
  end

  test 'camel_field should be camelized by string_converter_before_validation' do
    user = User.new(input_params)
    camel_field = user.camel_field.camelcase
    assert_not_equal camel_field, user.camel_field
    user.save
    assert_equal camel_field, user.camel_field
  end

  test 'surname should be unchanged' do
    user = User.new(input_params)
    surname = user.surname
    user.save
    assert_equal surname, user.surname
  end

  test 'user should be valid' do
    user = User.new(input_params)
    assert user.valid?
  end

  test 'person should not be valid' do
    person = Person.new(input_params)
    assert_not person.valid?
  end

  private

  def input_params
    { name: '  Name ', email: '  my_name@eXample.Org   ', surname: ' Surname  ', title: 'hello, world!', camel_field: 'my_strange_field'}
  end
end
