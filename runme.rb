#!/usr/bin/env ruby
# frozen_string_literal: true

require 'mongoid'

class MyModel
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :data,      type: BSON::Binary
end

settings = File.read("mongoid.yml")
parsed_settings = YAML.safe_load(settings, [], [], true)
Mongoid::Config.load_configuration(parsed_settings)

data = File.read("example.jpg")
my_model = MyModel.new
my_model.data = data
my_model.save
