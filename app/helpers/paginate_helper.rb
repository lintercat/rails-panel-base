module PaginateHelper
  def paginate(collection = nil, options = {})
    options[:renderer] = 'Binco::PaginationRenderer'
    will_paginate collection, options
  end
end
