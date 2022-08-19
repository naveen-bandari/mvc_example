class BaseController < ApplicationController

	DEFAULT_PER_PAGE_COUNT = 10
	DEFAULT_PAGE = 1

	def per_page
		params[:per_page] || DEFAULT_PER_PAGE_COUNT
	end

	def page
		params[:page] || DEFAULT_PAGE
	end
end
