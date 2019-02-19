class TestsController < ApplicationController
  before_action :tests_pages, only: %i[index]
  before_action :find_test, only: %i[show start]
  before_action :set_user, only: :start

  def index

  end

  def show
    
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def tests_pages
    @tests_pages = Test.page(params[:page]).per(3)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

end
