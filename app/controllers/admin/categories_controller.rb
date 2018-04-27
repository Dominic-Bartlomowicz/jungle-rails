class Admin::CategoriesController < ApplicationController

def index
  @Categories = Category.order("id DESC").all
end

def new
  @Category = Category.new
end

def create
  @Category = Category.new(Category_params)

if @Category.save
  redirect_to[:admin, categories], notice: "The new category has been created!"
else
  render :new
end
