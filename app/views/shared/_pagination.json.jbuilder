json.page resource.current_page
json.per_page params[:per_page] ? params[:per_page].to_i : 25
json.total_pages resource.total_pages
json.first_page_url trees_url(page: 1, per_page: params[:per_page] || 25, format: :json)
json.next_page_url resource.total_pages > 1 && resource.current_page < resource.total_pages ? trees_url(page: resource.current_page + 1, per_page: params[:per_page] || 25, format: :json) : nil
json.last_page_url trees_url(page: resource.total_pages, per_page: params[:per_page] || 25, format: :json)
